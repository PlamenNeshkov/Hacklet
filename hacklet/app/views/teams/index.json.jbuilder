json.array!(@teams) do |team|
  json.extract! team, :id, :name, :user_id, :event_id
  json.url team_url(team, format: :json)
end
