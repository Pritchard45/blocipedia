class WikiPolicy < ApplicationPolicy

  def destroy?
    user.admin? || record.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
