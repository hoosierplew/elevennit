class AddCategoriesToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :category_id, :integer, default: 0
    # Could have done the following, which is superior:
    # add_reference :posts, :category, index: true
    Post.find_each do |p|
      p.category_id = 0
    end
  end
end
