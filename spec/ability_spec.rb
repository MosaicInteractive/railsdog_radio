require "spec_helper"
require "cancan/matchers"

describe Ability do

  shared_examples_for "access_granted" do
    it "should allow edit" do
      ability.should be_able_to(:edit, resource)
    end
    it "should allow update" do
      ability.should be_able_to(:update, resource)
    end
    it "should allow read" do
      ability.should be_able_to(:read, resource)
    end
  end

  shared_examples_for "access_denied" do
    it "should not allow edit" do
      ability.should_not be_able_to(:edit, resource)
    end
    it "should not allow update" do
      ability.should_not be_able_to(:update, resource)
    end
    it "should not allow read" do
      ability.should_not be_able_to(:read, resource)
    end
  end

  context "with read_only user" do
    let(:user) { Factory(:read_only_user) }
    let(:ability) { Ability.new(user) }

    context "when resource is an Order" do
      let(:resource) { Order.new }

      it "should allow create" do
        ability.should be_able_to(:create, Order)
      end
      it "should allow index" do
        ability.should be_able_to(:index, Order)
      end

      context "and resource belongs to the user" do
        before { resource.user = user }
        it_should_behave_like "access_granted"
      end

      context "and resource does not belong to the user" do
        before { resource.user = User.new }

        it "should not allow edit" do
          ability.should_not be_able_to(:edit, resource)
        end

        it "should not allow update" do
          ability.should_not be_able_to(:update, resource)
        end

        it "should allow read" do
          ability.should be_able_to(:read, resource)
        end
      end

    end
  end

  context "with regular user" do
    let(:user) { User.new }
    let(:ability) { Ability.new(user) }

    context "when resource is an Order" do
      let(:resource) { Order.new }

      it "should allow create" do
        ability.should be_able_to(:create, Order)
      end
      it "should not allow index" do
        ability.should_not be_able_to(:index, Order)
      end

      context "which belongs to the user" do
        before { resource.user = user }
        it_should_behave_like "access_granted"
      end

      context "which does not belong to the user" do
        before { resource.user = User.new }
        it_should_behave_like "access_denied"
      end
    end
  end

end
