class Relationship < ActiveRecord::Base
  attr_accessible :data_file_id, :user_id

  belongs_to :data_file_id, class_name: "data_file", foreign_key: "data_file_id"
  belongs_to :user_id, class_name: "user", foreign_key: "user_id"

  validates :data_file_id, presence: true
  validates :user_id, presence: true
end