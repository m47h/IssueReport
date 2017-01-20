class Comment < ApplicationRecord # :nodoc:
  belongs_to :issue

  validates :body, presence: true
end
