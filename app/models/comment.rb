class Comment < ApplicationRecord # :nodoc:
  belongs_to :issue
  belongs_to :user

  validates :body, :issue_id, :user_id, presence: true
end
