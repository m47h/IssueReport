class Issue < ApplicationRecord # :nodoc:
  STATUS = %w(Open Pending Closed).freeze
  PRIORITY = %w(Low Normal High).freeze

  has_many :comments

  validates :name, :body, presence: true
  validates :name, uniqueness: true
end
