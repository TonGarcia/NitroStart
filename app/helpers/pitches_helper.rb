module PitchesHelper
  def widgets
    %w(hypothesis business project_build market_knowledge traction financial competitors provider campaign team)
  end

  def requested_equity
    @pitch.requested_equity
  end

  def formatted_requested_equity
    "#{number_with_precision(requested_equity, precision: 2, delimiter: ',')}%"
  end
end