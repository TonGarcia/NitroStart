module IdeasHelper
  def idea_all_attrs
    idea_problem_attrs+idea_hypothesis_attrs
  end

  def idea_index_attrs
    [:main_problem, :tag_line_pitch, :high_concept_pitch]
  end

  def idea_problem_attrs
    [:main_problem, :formatted_second_problems, :current_solution]
  end

  def idea_hypothesis_attrs
    [:tag_line_pitch, :high_concept_pitch, :why_must_success, :how_validate]
  end
end