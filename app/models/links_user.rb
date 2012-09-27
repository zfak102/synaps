# == Schema Information
#
# Table name: links_users
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  links_table_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class LinksUser < ActiveRecord::Base
  attr_accessible :links_table_id, :user_id

    belongs_to :user
    belongs_to :links_table

  validates :user_id, presence: true
  validates :links_table_id, presence: true
  validates_associated :links_tables
  validates_associated :user

end
