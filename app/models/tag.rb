class Tag < ActiveRecord::Base
  has_many :tag_associations
  has_many :listings, through: :tag_associations
end
