class DropStadiumPosts < ActiveRecord::Migration[7.0]
  def change
    drop_table :stadium_posts, if_exists: true
  end
end
