# == Schema Information
#
# Table name: data_files
#
#  id         :integer          not null, primary key
#  Info1      :string(255)
#  Info2      :string(255)
#  Category   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DataFile < ActiveRecord::Base
  attr_accessible :Category, :Info1, :Info2
  has_many :relationships, foreign_key: "data_file_id", dependent: :destroy
  has_many :users, :through => :relationship

    validates :Info1, presence: true, length: { maximum: 140 }

end


