# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # guest user (not logged in)
    # can read public recepies and details
    can :read, Recipe, public: true

    # return unless user is not signed in
    return unless user.present?

    # if user is admin then he can do anything
    if user.is? :admin
      can :manage, :all
    else 
      # if user is default then
      # he can read all
      can :read, :all
      # he can create, and destroy his own foods
      can [:create, :destroy], Food, user_id: user.id
      # he can create, and destroy his own recipes
      can [:create, :destroy], Recipe, user_id: user.id
    end

  end
end
