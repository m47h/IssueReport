class Issue < ApplicationRecord # :nodoc:
  STATUS = %w(Open Pending Closed).freeze
  PRIORITY = %w(Low Normal High).freeze
  belongs_to :user
  has_many :comments
  has_attached_file :image,
                    styles: { thumb: '64x64#' },
                    default_url: '/system/:class/:attachment/64x64.png'

  validates :name, :body, presence: true
  validates :name, uniqueness: true
  validates_attachment :image,
                       content_type: { content_type: ['image/jpeg', 'image/gif', 'image/png'] },
                       size: { in: 0..1.megabytes }
end
