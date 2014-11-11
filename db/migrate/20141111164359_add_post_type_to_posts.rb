class AddPostTypeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :post_type, :integer, default: 0
    Post.find_each do |p|
      p.post_type = 1 unless p.body.blank?
      p.post_type = 0 unless p.link.blank?
      p.save!
    end
  end
end
