module PitchesHelper
  def widgets
    small_widgets+med_widgets+big_widgets
  end

  def small_widgets
    %w(hypothesis business project_build market_knowledge traction financial)
  end

  def med_widgets
    %w(competitors team)
  end

  def big_widgets
    %w(campaign)
  end

  def requested_equity
    @pitch.requested_equity
  end

  def formatted_requested_equity
    "#{number_with_precision(requested_equity, precision: 2, delimiter: ',')}%"
  end
end