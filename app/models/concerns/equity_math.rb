# Capability Equity Calc method
module EquityMath
  extend ActiveSupport::Concern

  # Return it System Estimate NITRO Equity
  def requested_equity(formatted=false)
    # Initializers
    base_equity = 5
    amount_attrs = 0
    points_rate = 1000
    full_percent = 100
    amount_filled_attrs = 0
    variable_equity = full_percent - base_equity
    associations = [:idea, :market, :project, :financial, :traction, :supporter, :business, :competitor]

    associations.each do |association|
      # add Total Attrs
      amount_attrs = amount_attrs + self.active(association).attrs_that_matters.length
      # add Filled Attrs
      amount_filled_attrs = amount_filled_attrs + self.active(association).amount_filled(:filled_amount)
    end

    # Calc it filled up attrs percent amount
    amount_filled_attrs_percent = amount_filled_attrs*full_percent/amount_attrs

    # If nothing filled it is 100% for NITRO
    if amount_filled_attrs_percent == 0 || amount_filled_attrs_percent == 1
      additional_equity = variable_equity
    else
      additional_equity = (1/amount_filled_attrs_percent.to_f)*points_rate
    end

    # Stage addition percent
    stage_additional = 0
    case self.active(:project).stage_sym
      when :idea
        stage_additional = 60
      when :validated
        stage_additional = 35
      when :mvp
        stage_additional = 15
      when :pre_operational
        stage_additional = 5
      when :operational
        stage_additional = 0
      when :scaling
        stage_additional = 0
      when :international_scaling
        stage_additional = 0
    end

    # Calc it final equity requested
    equity = base_equity + additional_equity + stage_additional
    equity = 100 if equity > 100

    formatted ? equity.to_s.to_percent_formatter : equity
  end
end