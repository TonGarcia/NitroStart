module PitchesHelper
  def widgets
    %w(hypothesis traction market_knowledge  project_build business team financial competitors provider)
  end

  def validation_widgets
    %w(hypothesis team competitors campaign)
  end

  def canvas_widgets
    %w(traction market_knowledge  project_build business financial provider)
  end

  def forbes_pitch_deck
    'http://www.forbes.com/sites/chancebarnett/2014/05/09/investor-pitch-deck-to-raise-money-for-startups/#4dc4c6ee4863'
  end

  def requested_equity
    @pitch.requested_equity
  end

  def formatted_requested_equity
    "#{number_with_precision(requested_equity, precision: 2, delimiter: ',')}%"
  end
end