class CreateLinksTables < ActiveRecord::Migration
  def change
    create_table :links_tables do |t|
      t.integer :link1
      t.integer :link2
      t.integer :count

      t.timestamps
    end
  end
end
