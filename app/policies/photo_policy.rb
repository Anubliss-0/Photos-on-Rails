class PhotoPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def create?
    user.id == 1
  end

  def show?
    true
  end

  def destroy?
    record.user == user
  end

  def update?
    record.user == user
  end
end
