# == Schema Information
#
# Table name: datafiles
#
#  id                 :integer          not null, primary key
#  Info1              :string(255)
#  Info2              :string(255)
#  Category           :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  authenticity_token :string(255)
#

class Datafile < ActiveRecord::Base
  attr_accessible :Category, :Info1, :Info2, :user
  has_many :relationships, foreign_key: "datafile_id", dependent: :destroy
  has_many :users, :through => :relationship

    validates :Info1, :uniqueness => { :scope => :Category,
    :message => "Data already contained on file" }, presence: true, length: { maximum: 140 }



  @@return_reason_keys = { "movie" => "movie",
                           "book" => "book",
                           "song" => "song",
                           "other" => "other"}

  def self.return_reason_select
    @@return_reason_keys.invert
  end

  def return_reason
    @@return_reason_keys[Category]
  end

end


