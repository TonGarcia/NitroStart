module ProjectsHelper
  def project_all_attrs
    project_index_attrs
  end

  def project_index_attrs
    [:stage, :awards, :patent]
  end
end
