json.array!(@issues) do |issue|
  json.extract! issue, :id, :title, :description, :solved, :event_id, :user_id
  json.url issue_url(issue, format: :json)
end
