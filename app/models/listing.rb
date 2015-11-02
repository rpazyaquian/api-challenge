class Listing < ActiveRecord::Base
  has_many :photos
  has_many :tag_associations
  has_many :tags, through: :tag_associations
end
