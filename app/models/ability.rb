class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    else
      if user.has_role? :silver
        can :manage, Project
        can :manage, Participant
      end
      can :view, :gold if user.has_role? :gold
      can :manage, Project if user.has_role? :platinum
    end
  end
end
