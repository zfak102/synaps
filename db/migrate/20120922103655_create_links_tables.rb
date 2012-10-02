class CreateLinksTables < ActiveRecord::Migration
  def change
    create_table :links_tables do |t|
      t.string :link1
      t.string :link2
      t.integer :count

      t.timestamps
    end
  end
end
