json.(image, :url)
json.thumbs do
  json.array! image.thumbs, partial: 'thumbs/thumb', as: :thumb
end
