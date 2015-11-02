class Photo < ActiveRecord::Base
  belongs_to :listing
  has_many :images
end
