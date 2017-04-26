class CommentPolicy < ApplicationPolicy # :nodoc:
  class Scope < Scope # :nodoc:
    def resolve
      scope
    end
  end

  def create?
    true
  end
end
