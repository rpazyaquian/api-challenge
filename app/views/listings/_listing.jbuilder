json.(listing, :uuid, :active, :name, :email, :description, :address, :city, :state, :zipcode, :lat, :lng, :phone_number, :updated_at)
json.photos do
  json.array! listing.photos, partial: 'photos/photo', as: :photo
end
json.tag_list do
  json.array! listing.tags.map { |tag| tag.label }
end