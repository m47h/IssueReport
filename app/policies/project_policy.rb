class ProjectPolicy < ApplicationPolicy # :nodoc:
  class Scope < Scope # :nodoc:
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user_id: user.id)
      end
    end
  end

  def index
    true
  end

  def create?
    true
  end

  def edit?
    user.owner_of?(record) || user.admin?
  end
end
