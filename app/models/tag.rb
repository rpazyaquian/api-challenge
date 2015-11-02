class Tag < ActiveRecord::Base
  has_many :listings, through: :tag_associations
end
