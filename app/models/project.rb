class Project < ApplicationRecord # :nodoc:
  validates :name, presence: true
  validates :name, uniqueness: true

  belongs_to :user

  default_scope { order(created_at: :asc) }
end
