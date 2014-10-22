class Ability
  include CanCan::Ability

  def initialize(current_user)
    @user = current_user || User.new
    everybody_abilities
    user_abilities if @user.persisted?
    can :manage, :all if @user.admin?
  end

  def everybody_abilities
    can :create, Subscribe
    can :read, Post, state: %w{published approved}
  end

  def user_abilities
    can :manage, Comment, user_id: @user.id
  end
end
