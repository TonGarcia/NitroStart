json.array!(@ideas) do |idea|
  json.extract! idea, :id, :main_problem, :second_problem, :current_solution, :tag_line_pitch, :high_concept_pitch, :pitch_id
  json.url idea_url(idea, format: :json)
end
