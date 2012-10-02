class CreateDatafiles < ActiveRecord::Migration
  def change
    create_table :datafiles do |t|
      t.string :Info1
      t.string :Info2
      t.string :Category

      t.timestamps
    end
  end
end
