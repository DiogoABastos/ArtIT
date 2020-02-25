class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

    def create?
      record.user != user
    end

    def update?
      user_is_owner?
    end

    def user_is_owner?
      record.user == user
    end
end
