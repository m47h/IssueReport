class User < ApplicationRecord # :nodoc:
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
