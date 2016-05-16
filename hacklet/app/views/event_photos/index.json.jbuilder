json.array!(@event_photos) do |event_photo|
  json.extract! event_photo, :id, :event_id, :photo
  json.url event_photo_url(event_photo, format: :json)
end
