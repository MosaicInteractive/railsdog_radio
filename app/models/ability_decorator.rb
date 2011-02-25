class AbilityDecorator
  include CanCan::Ability

  # We don't want the general public messing up our data so we'll restrict what the public
  # admin account can do.
  def initialize(user)
    user ||= User.new
    if user.has_role? 'read_only'
      can :read, :all
      can :index, :all
      can :admin, :all

      cannot :manage, User
      cannot :edit, Order
    end
  end

end

Ability.register_ability(AbilityDecorator)
