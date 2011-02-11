require 'spec_helper'

describe Order do

  let(:order) { Order.create :email => "foo@bar.com" }
  let(:gateway) { Gateway::Bogus.new(:name => "Credit Card", :active => true) }

  describe "#next" do

    context "in the cart state" do

      before { order.state = "cart" }

      it "should transition to payment" do
        order.next
        order.state.should == "payment"
      end

    end

    context "in the payment state" do

      before do
         order.stub :create_shipment!
         order.state = "payment"
       end

      it "should transition to the confirm state" do
        order.next
        order.state.should == "confirm"
      end

      it "should receive create_and_tax_charge!" do
        order.should_receive :create_tax_charge!
        order.next
      end

      it "should receive create_shipment!" do
        order.should_receive :create_shipment!
        order.next
      end

    end

    context "in the confirm state" do

      before { order.state = "confirm" }

      it "should transition to payment" do
        order.next
        order.state.should == "complete"
      end

    end

  end

end
