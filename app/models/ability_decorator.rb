class AbilityDecorator
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_role? 'read_only'
      can :read, :all
      can :index, :all
    end
  end

end

Ability.register_ability(AbilityDecorator)
