class AddIndexToDatafilesInfo1 < ActiveRecord::Migration
  def change
  	add_index :datafiles, [:Info1, :Category] , unique: true
  end
end
