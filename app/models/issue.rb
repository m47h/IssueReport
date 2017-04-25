class Issue < ApplicationRecord # :nodoc:
  STATUS = %w(Open Pending Closed).freeze
  PRIORITY = %w(Low Normal High).freeze
  belongs_to :user
  belongs_to :project
  has_many :comments, dependent: :destroy
  has_attached_file :image,
                    styles: { thumb: '64x64#' },
                    default_url: '/system/:class/:attachment/64x64.png'

  validates :name, :body, presence: true
  validates :name, uniqueness: { scope: :project_id, case_sensitive: false }
  validates_attachment :image,
                       content_type: { content_type: ['image/jpeg', 'image/gif', 'image/png'] },
                       size: { in: 0..1.megabytes }

  default_scope { order(created_at: :asc) }

  def self.navbar_search(project_id, search)
    if project_id.blank?
      Issue.where('LOWER("issues"."name") like ?', "%#{search.downcase}%")
    else
      Issue.where(project_id: project_id).
        where('LOWER("issues"."name") like ?', "%#{search.downcase}%")
    end
  end
end
