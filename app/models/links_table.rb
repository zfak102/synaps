# == Schema Information
#
# Table name: links_tables
#
#  id         :integer          not null, primary key
#  link1      :integer
#  link2      :integer
#  count      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class LinksTable < ActiveRecord::Base
  attr_accessible :count, :link1, :link2

  has_many :links_users, foreign_key: "links_table_id", dependent: :destroy
  has_many :users, :through => :relationship
  belongs_to :data_file

  validates :link1, presence: true
  validates :link2, presence: true

end

    def counter
      
    end
