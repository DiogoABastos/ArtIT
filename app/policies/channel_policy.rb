class ChannelPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def user?
    true
  end

  def add?
    user?
  end
end
