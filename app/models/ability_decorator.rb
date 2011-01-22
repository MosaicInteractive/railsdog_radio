class AbilityDecorator
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_role? 'read_only'
      # Read only users can have read only access to all admin stuff
      can :read, :all
      can :index, :all
      can :admin, :all
    end
  end

end

Ability.register_ability(AbilityDecorator)
