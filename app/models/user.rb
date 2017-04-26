class User < ApplicationRecord # :nodoc:
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :projects
  has_many :issues
  has_many :comments

  def owner_of?(record)
    id == record.user_id
  end
end
