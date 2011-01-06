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

  def body_id
    @body_id = "checkout"
  end

end