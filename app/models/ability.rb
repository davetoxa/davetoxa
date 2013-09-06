class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    everybody_abilities
    admin_abilities if user.admin?
  end

  def everybody_abilities
    can :create, Subscribe
  end

  def admin_abilities
    can :manage, :all
  end

end
