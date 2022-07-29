class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, [Post, Comment]

    return unless user.present?

    can %i[create destroy], [Post, Comment], author: user

    return unless user.role?

    can :destroy, [Post, Comment]
  end
end
