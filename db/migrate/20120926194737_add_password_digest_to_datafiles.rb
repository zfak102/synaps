class AddPasswordDigestToDatafiles < ActiveRecord::Migration
  def change
    add_column :datafiles, :authenticity_token, :string
  end
end
