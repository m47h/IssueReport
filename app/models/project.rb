class Project < ApplicationRecord # :nodoc:
  validates :name, presence: true
  validates :name, uniqueness: true

  belongs_to :user
  has_many :issues

  default_scope { order(created_at: :asc) }
end
