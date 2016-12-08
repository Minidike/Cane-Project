class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role? :admin
      can :manage, :all
    else
      can :read, :all
      can :create, :all
      can :upvote, Fact
    end
    
    can :update, Fact do |fact|
      fact.user == user
    end
    
    can :destroy, Fact do |fact|
      fact.user == user
    end
    
    can :update, Comment do |comment|
      comment.user == user
    end
    
    can :destroy, Comment do |comment|
      comment.user == user
    end
  end
end
