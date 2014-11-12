class Category < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true, length: { minimum: 2, maximum: 20 }
  validates :title, length: { maximum: 100 }
  validates :description, length: { maximum: 500 }
  validates :sidebar, length: { maximum: 5120 }
  validates :submission_text, length: { maximum: 1024 }

  has_many :posts
  default_scope { order(:name) }
end
