class Category < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true, length: { minimum: 2, maximum: 20 }
  validates :title, length: { maximum: 100 }
  validates :description, length: { maximum: 500 }
  validates :sidebar, length: { maximum: 5120 }
  validates :submission_text, length: { maximum: 1024 }

  has_many :posts
  default_scope { order('lower(name) ASC') }
  scope :added_today, -> { where('created_at > ?', Time.now.beginning_of_day) }
  scope :added_after, -> (time) { where('created_at > ?', time) }
end


# LAMBDA EXAMPLES BELOW
# class User < ActiveRecord::Base
#   scope :active, -> { where(active: true) }
#   scope :admin, -> { where(user_type: 'admin') }
# end
