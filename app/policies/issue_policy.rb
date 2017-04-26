class IssuePolicy < ApplicationPolicy # :nodoc:
  class Scope < Scope # :nodoc:
    def resolve
      project.issues
    end
  end

  def index?
    true
  end

  def create?
    true
  end

  def edit
    user.owner_of?(record)
  end
end
