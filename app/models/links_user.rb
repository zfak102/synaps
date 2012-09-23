class LinksUser < ActiveRecord::Base
  attr_accessible :links_table_id, :user_id

    belongs_to :user
    belongs_to :links_table
end
