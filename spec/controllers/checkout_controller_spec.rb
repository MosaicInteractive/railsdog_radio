require 'spec_helper'

describe CheckoutController do

  let(:order) { Order.new }
  let(:user) { mock_model User }
  let(:token) { "some_token" }

  before do
    order.stub :checkout_allowed? => true, :user => user, :new_record? => false
    controller.stub :current_order => order
    controller.stub :current_user => nil
  end

  describe "#update_registration" do
    let(:user) { user = mock_model User }

    it "should change the order state to payment" do
      controller.stub :check_authorization
      order.stub :update_attributes => true
      put :update_registration
      order.state.should == "payment"
    end

  end

  describe "#edit" do

    context "when in payment state" do

      it "should create a billing and shipping address" do
        controller.stub :check_authorization

        get :edit, { :state => 'payment' }
      end

    end

  end


end
