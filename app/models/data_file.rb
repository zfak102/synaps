class DataFile < ActiveRecord::Base
  attr_accessible :Category, :Info1, :Info2
  has_many :relationships, foreign_key: "data_file_id", dependent: :destroy
  has_many :users, :through => :relationship

  validates :user_id, presence: true
  validates :Info1, presence: true, length: { maximum: 140 }

end


