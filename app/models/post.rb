class Post < ActiveRecord::Base
  validates :title, length: { minimum: 2, maximum: 255 }, presence: true
  validates :link, presence: true, if: :link?
  validates :link, length: { maximum: 2000 }
  validates :body, presence: true, if: :text?
  enum post_type: [:link, :text]
end
