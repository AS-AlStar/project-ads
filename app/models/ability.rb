# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :index, HomeController
    can :show, Ad
    return unless user.present?
    can %i[show], User, id: user.id
    can %i[show new create], Ad
    can %i[destroy], Ad, user_id: user.id
    can %i[edit update], Ad, user_id: user.id, state: ['draft', 'archived', 'rejected']
    return unless user.admin?
    can :manage, :all
    cannot %i[new create edit], Ad
  end
end
