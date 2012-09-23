class DataFile < ActiveRecord::Base
  attr_accessible :Category, :Info1, :Info2
  has_and_belongs_to_many :users

  validates :user_id, presence: true
  validates :Info1, presence: true, length: { maximum: 140 }

end


