class AddUseridToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :user,  index: true, default: 1
  end
end
