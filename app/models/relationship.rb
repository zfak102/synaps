# == Schema Information
#
# Table name: relationships
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  datafile_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Relationship < ActiveRecord::Base
  attr_accessible :datafile_id, :user_id

  belongs_to :datafile, class_name: "datafile", foreign_key: "datafile_id"
  belongs_to :user, class_name: "user", foreign_key: "user_id"

  validates :datafile_id, presence: true
  validates :user_id, presence: true
  validates_associated :user
  validates_associated :datafile


end
