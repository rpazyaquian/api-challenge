class Image < ActiveRecord::Base
  belongs_to :listing
  has_many :thumbs
end
