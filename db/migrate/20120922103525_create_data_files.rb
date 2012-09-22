class CreateDataFiles < ActiveRecord::Migration
  def change
    create_table :data_files do |t|
      t.string :Info1
      t.string :Info2
      t.integer :Category

      t.timestamps
    end
  end
end
