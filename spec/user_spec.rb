require "spec_helper"
#require "cancan/matchers"

describe User do

  context 'has role read_only' do
    let(:user) { mock_model(User, :has_role? => true) }
    let(:ability) { Ability.new(user) }

    it 'has read_only access' do
      Ability.register_ability(UserDecorator)
      ability.can?(:read, mock_model(Address)).should be_true
    end
  end

end
