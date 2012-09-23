class CreateLinksUsers < ActiveRecord::Migration
  def change
    create_table :links_users do |t|
      t.integer :user_id
      t.integer :links_table_id

      t.timestamps
    end
    

   add_index :links_users, :links_table_id
   add_index :links_users, :user_id
   add_index :links_users, [:links_table_id, :user_id], unique: true

  end
end
