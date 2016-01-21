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

    associations.each do |association|
      # Set association & additional equity objs
      model_association = self.active(association)
      stage_obj = model_association if model_association.is_a?Project
      financial_obj = model_association if model_association.is_a?Financial

      # add Total Attrs
      amount_attrs = amount_attrs + model_association.attrs_that_matters.length
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
    stage_obj = self.active(:project) unless stage_obj
    stage_additional = 0
    stage = stage_obj.stage_sym

    # If have a Patent, it can be a MVP
    mvp_id = Helpers::Enum.find(:start_up_stages, :sym, 'mvp')[:id]
    stage = :mvp if stage_obj.patent? && stage_obj.stage < mvp_id

    case stage
      when :idea
        stage_additional = 35
      when :validated
        stage_additional = 30
      when :mvp
        stage_additional = 10
      when :pre_operational
        stage_additional = 5
      when :operational
        stage_additional = 0
      when :scaling
        stage_additional = 0
      when :international_scaling
        stage_additional = 0
    end

    # Get bootstrapping
    financial_obj = self.active(:financial) unless financial_obj
    !financial_obj.bootstrapped.nil? && financial_obj.bootstrapped > 0 ? bootstrapping_additional = 0 : bootstrapping_additional = 10

    # No Costumer, only lead, set additional
    (financial_obj.nil? || financial_obj.total_costumers.nil? || financial_obj.total_costumers == 0) ? no_costumer_additional = 20 : no_costumer_additional = 0

    # Calc it final equity requested
    equity = base_equity + additional_equity + stage_additional + bootstrapping_additional + no_costumer_additional

    # Prevent Equity to be greater than 100 & filling not decrease percent
    if equity >= 100
      if equity == 100 || amount_filled_attrs_percent >= 10
        equity = 98.5
      else
        equity = 100
      end
    end

    formatted ? equity.to_s.to_percent_formatter : equity
  end

  def associations
    [:idea, :market, :project, :financial, :traction, :supporter, :business, :provider, :competitor]
  end
end