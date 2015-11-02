class Image < ActiveRecord::Base
  belongs_to :photo
  has_many :thumbs
end
