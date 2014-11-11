class Post < ActiveRecord::Base
  validates :title, length: { minimum: 2, maximum: 255 }
end
