json.array!(@projects) do |project|
  json.extract! project, :id, :stage, :value_proposition, :pitch_id, :start_up_id
  json.url project_url(project, format: :json)
end
