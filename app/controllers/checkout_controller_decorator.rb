CheckoutController.class_eval do

  before_filter :body_id

  def update_registration
    current_order.state = "address_and_payment"
    if current_order.update_attributes(params[:order])
      redirect_to checkout_path
    else
      @user = User.new
      render 'registration'
    end
  end

  private


  def object_params
    # For payment step, filter order parameters to produce the expected nested attributes for a single payment and its source, discarding attributes for payment methods other than the one selected
    if @order.address_and_payment?
      if params[:payment_source].present? && source_params = params.delete(:payment_source)[params[:order][:payments_attributes].first[:payment_method_id].underscore]
        params[:order][:payments_attributes].first[:source_attributes] = source_params
      end
      if (params[:order][:payments_attributes])
        params[:order][:payments_attributes].first[:amount] = @order.total
      end
      params[:order][:payments_attributes].first[:source_attributes][:first_name] = params[:order][:bill_address_attributes][:firstname]
      params[:order][:payments_attributes].first[:source_attributes][:last_name] = params[:order][:bill_address_attributes][:lastname]
      params[:order]
    end
  end

  def body_id
    @body_id = "checkout"
  end

  def before_address_and_payment
    before_address
    before_payment
  end


  def before_shipping_and_confirm
    before_delivery
  end

end