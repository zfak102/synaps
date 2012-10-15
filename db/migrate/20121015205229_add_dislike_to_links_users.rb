class AddDislikeToLinksUsers < ActiveRecord::Migration
  def change
    add_column :links_users, :dislike, :boolean
  end
end
