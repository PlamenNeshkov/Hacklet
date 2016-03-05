json.array!(@events) do |event|
  json.extract! event, :id, :title, :description, :image, :start, :end, :max_participants
  json.url event_url(event, format: :json)
end
