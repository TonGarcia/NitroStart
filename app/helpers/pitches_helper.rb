module PitchesHelper
  def widgets
    %w(campaign team competitors market_knowledge business provider project_build  traction financial)
  end

  def validation_widgets
    %w(hypothesis competitors team campaign)
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

  def published_pitches
    @pitches.joins(:campaigns).where(campaigns: {draft: false})
  end

  def draft_pitches
    # Pitch that doesn't have any campaign
    no_campaign_pitches = @pitches.find_by_sql("select * from pitches where id not in ( select pitch_id from campaigns ) and pitches.user_id = #{@current_user.id}")
    # Draft Pitches
    drafts = @pitches.joins(:campaigns).where(campaigns: {draft: true})
    (drafts+no_campaign_pitches).uniq
  end
end