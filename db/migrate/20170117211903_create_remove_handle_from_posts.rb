class CreateRemoveHandleFromPosts < ActiveRecord::Migration
  def change
  	remove_column :posts, :handle
  	remove_column :announcements, :handle
  end
end
