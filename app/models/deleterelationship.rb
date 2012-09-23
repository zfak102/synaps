class Relationship < ActiveRecord::Base
  attr_accessible :datainfo_id, :userinfo_id

  belongs_to :userinfo, :class_name => "User", :foreign_key => "user" 
  belongs_to :datainfo, :class_name => "Data_file", :foreign_key => "data_file"

  validates :userinfo_id, presence: true
  validates :datainfo_id, presence: true
end
