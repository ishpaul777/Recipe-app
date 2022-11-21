class Ability
  include CanCan::Ability

  def initialize(user)
    # guest user (not logged in)
    # can read public recepies and details
    # can :read, Recipe, public: true

    # # return unless user is not signed in
    # return unless user.present?
    # # if user is default then
    # # he can read all
    # can :read, :all
    # # he can create, update and destroy his own recipes
    # can [:create, :update, :destroy], Recipe, user_id: user.id
    # # he can create, update and destroy his own recipe foods
    # can [:create, :update, :destroy], RecipeFood, recipe: { user_id: user.id }
    # # he can create, update and destroy his own foods
    # can [:create, :update, :destroy], Food, user_id: user.id

    # return unless user.admin?
    # # if user is admin then
    # # he can do everything
    can :manage, :all
  end
end
