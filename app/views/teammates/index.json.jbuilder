json.array!(@teammates) do |teammate|
  json.extract! teammate, :id, :role, :expertise, :contacts, :team_id, :user_id
  json.url teammate_url(teammate, format: :json)
end
