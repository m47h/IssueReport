class Issue < ApplicationRecord # :nodoc:
  STATUS = %w(Open Pending Closed).freeze
  PRIORITY = %w(Low Normal High).freeze

  validates_presence_of :name, :body
end
