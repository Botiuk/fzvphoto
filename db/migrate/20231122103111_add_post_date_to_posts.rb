class AddPostDateToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :postdate, :date
  end
end
