class LinksTable < ActiveRecord::Base
  attr_accessible :count, :link1, :link2

  belongs_to :data_file

  validates :link1, presence: true
  validates :link2, presence: true

end

    def counter
      
    end