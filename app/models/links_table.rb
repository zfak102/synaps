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
  attr_accessible :count, :link1, :link2, :datafiles_id

  has_many :links_users, foreign_key: "links_table_id", dependent: :destroy
  has_many :users, :through => :relationship
  belongs_to :datafile

  validates :link1, presence: true
  validates :link2, presence: true
  validates :link1, :uniqueness => { :scope => :link2 }
  validates :link1, :numericality => { :less_than_or_equal_to => Datafile.find(:all).count}
  validates :link2, :numericality => { :less_than_or_equal_to => Datafile.find(:all).count}






end
