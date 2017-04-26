class Project < ApplicationRecord # :nodoc:
  validates :name, presence: true
  validates :name, uniqueness: { scope: :user_id, case_sensitive: false }

  belongs_to :user
  has_many :issues

  default_scope { order(created_at: :asc) }
end
