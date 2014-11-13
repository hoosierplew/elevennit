class Post < ActiveRecord::Base
  acts_as_commentable

  validates :title, length: { minimum: 2, maximum: 255 }, presence: true
  validates :link, presence: true, if: :link?
  validates :link, length: { maximum: 2000 }
  validates :body, presence: true, if: :text?

  enum post_type: [:link, :text]

  belongs_to :category
  belongs_to :user
  default_scope { order('updated_at DESC').includes(:category).includes(:user) }
  scope :with_categories, -> { includes(:category) }
  scope :with_user, -> { includes(:user) }

  self.per_page = 10
end
