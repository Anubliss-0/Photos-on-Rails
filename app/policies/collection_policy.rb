class CollectionPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def create?
    # current_user.admin == true
    #for testing purposes setting this to true
    true
  end
end
