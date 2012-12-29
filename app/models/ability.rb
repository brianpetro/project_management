class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    else
      if user.has_role? :silver
				can :manage, Project # Top Level.
				cannot :destroy, Project
				can :manage, Note # Nested in Project.
				can :manage, Blueprint # Nested in Project.
				can :manage, Coordinate # Connects blueprints and notes, WILL include dynamic coordinates.
				can :manage, User # Top Level.
				cannot :destroy, User
				can :manage, Participant # Nested in Project.
				can :read, City # Top Level.
				can :read, Reviewer # Nested in City.
				can :manage, Seal # Nested in City.
      end
      can :view, :gold if user.has_role? :gold
      if user.has_role? :platinum
				can :read, Project
				can :read, Note
				can :read, Blueprint 
				can :read, Coordinate 
				can :manage, User 
				can :read, Participant
				can :update, City
				can :read, City
				can :manage, Reviewer
				can :update, Seal
				can :read, Seal
			end
    end
  end
end
