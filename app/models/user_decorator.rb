class UserDecorator
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_role? 'read_only'
      can :read, :all
    end
  end

end

Ability.register_ability(UserDecorator)
