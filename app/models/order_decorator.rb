Order.class_eval do

  state_machines.clear
  state_machine :initial => 'cart', :use_transactions => false do

    # custom checkout steps
    event :next do
      transition :from => 'cart', :to => 'address_and_payment'
      transition :from => 'address_and_payment', :to => 'shipping_and_confirm'
      transition :from => 'shipping_and_confirm', :to => 'complete'
    end

    event :cancel do
      transition :to => 'canceled', :if => :allow_cancel?
    end
    event :return do
      transition :to => 'returned', :from => 'awaiting_return'
    end
    event :resume do
      transition :to => 'resumed', :from => 'canceled', :if => :allow_resume?
    end
    event :authorize_return do
      transition :to => 'awaiting_return'
    end

    before_transition :to => 'complete' do |order|
      begin
        order.process_payments!
      rescue Spree::GatewayError
        if Spree::Config[:allow_checkout_on_gateway_error]
          true
        else
          false
        end
      end
    end

    after_transition :to => 'complete', :do => :finalize!
    after_transition :to => 'shipping_and_confirm', :do => :create_tax_charge!
    after_transition :to => 'shipping_and_confirm', :do => :create_shipment!
    after_transition :to => 'canceled', :do => :after_cancel

  end

  def create_shipment_with_default!
    shipping_method ||= available_shipping_methods.first
    save

    create_shipment_without_default!
  end

  alias_method_chain :create_shipment!, :default

end
