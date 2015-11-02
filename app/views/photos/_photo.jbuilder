json.(photo, :uuid, :interest_point_id, :created_at, :updated_at, :name)
json.images do
  json.array! photo.images, partial: 'images/image', as: :image
end
