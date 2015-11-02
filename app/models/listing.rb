class Listing < ActiveRecord::Base
  has_many :photos
  has_many :tags, through: :tag_listings
end
