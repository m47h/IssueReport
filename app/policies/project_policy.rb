class ProjectPolicy < ApplicationPolicy # :nodoc:
  class Scope < Scope # :nodoc:
    def resolve
      user.projects
    end
  end

  def index
    true
  end

  def create?
    true
  end

  def edit?
    user.owner_of?(record)
  end
end
