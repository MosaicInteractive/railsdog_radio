CheckoutController.class_eval do

  before_filter :body_id

  def update_registration
    current_order.state = "payment"
    if current_order.update_attributes(params[:order])
      redirect_to checkout_path
    else
      @user = User.new
      render 'registration'
    end
  end

  #overriden the handle ppx payment/redirect
  def update
    if @order.update_attributes(object_params)

      if @order.confirm? && @order.payment.payment_method.is_a?(BillingIntegration::PaypalExpress)
        @order.create_shipment! #in case shipping method has changed

        redirect_to paypal_payment_order_checkout_url @order, :payment_method_id => @order.payment.payment_method
      else
        if @order.next
          state_callback(:after)
        else
          flash[:error] = I18n.t(:payment_processing_failed)
          redirect_to checkout_state_path(@order.state) and return
        end

        if @order.state == "complete" || @order.completed?
          flash[:notice] = I18n.t(:order_processed_successfully)
          flash[:commerce_tracking] = "nothing special"
          redirect_to completion_route
        else
          redirect_to checkout_state_path(@order.state)
        end
      end

    else
      render :edit
    end
  end

  def set_shipping
    if @order.update_attributes(object_params)
      @order.create_shipment!
    end

    render :json => @order.reload.to_json(:include => :adjustments)
  end

  private
  def redirect_to_paypal_express_form_if_needed
    #just overrides method from ext
  end

  def object_params
    # For payment step, filter order parameters to produce the expected nested attributes for a single payment and its source, discarding attributes for payment methods other than the one selected
    if @order.payment? && params.key?(:payment_source)
      if params[:payment_source].present? && source_params = params.delete(:payment_source)[params[:order][:payments_attributes].first[:payment_method_id].underscore]
        params[:order][:payments_attributes].first[:source_attributes] = source_params
        params[:order][:payments_attributes].first[:source_attributes][:first_name] = params[:order][:bill_address_attributes][:firstname]
        params[:order][:payments_attributes].first[:source_attributes][:last_name] = params[:order][:bill_address_attributes][:lastname]
      end

      if params[:order][:payments_attributes]
        params[:order][:payments_attributes].first[:amount] = @order.total
      end
    end
    params[:order]
  end

  def body_id
    @body_id = "checkout"
  end

  def before_payment
    before_address
    current_order.payments.destroy_all if request.put?
  end

  def before_confirm
    before_delivery
  end

end
