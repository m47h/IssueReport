class IssuePolicy < ApplicationPolicy # :nodoc:
  class Scope < Scope # :nodoc:
    def resolve
      scope.where(user_id: user.id)
    end
  end

  def index?
    true
  end

  def search?
    true
  end

  def create?
    true
  end

  def edit
    user.owner_of?(record)
  end
end
