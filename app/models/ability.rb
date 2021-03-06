class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if User.exists? user.id
      case user.user_profile.role
        
      when "store_manager"
        can :manage, :user_management
        can [:read, :create, :update], Customer
        can [:read, :create, :update], Product
        can :manage, Sale
        can :read, :dashboard
      when "salesman"
        cannot :manage, :user_management
        can [:read, :create, :update], Customer
        can [:read, :create, :update], Product
        can [:read, :create, :update], Sale
        can :read, :dashboard
      end
    end
  end
end
