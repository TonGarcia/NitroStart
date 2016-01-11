module IdeasHelper
  def idea_index_attrs
    [:main_problem, :tag_line_pitch, :high_concept_pitch]
  end

  def idea_problem_attrs
    [:main_problem, :second_problems, :current_solution]
  end

  def idea_hypothesis_attrs
    [:tag_line_pitch, :high_concept_pitch, :how_validate]
  end
end