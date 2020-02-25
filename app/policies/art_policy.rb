class ArtPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where.not(user: user)
    end
  end
    def show?
      true
    end
end
