class Pitch < ActiveRecord::Base
  # Concerns Dependencies
  include HistoricalTrackable

  # Relations
  belongs_to :user

  # The many associations mean the many possibilities
  has_many :ideas
  has_many :teams
  has_many :markets
  has_many :revenues
  has_many :projects
  has_many :financials
  has_many :tractions
  has_many :supporters
  has_many :businesses
  has_many :investments
  has_many :competitors

  # Rails validations
  validates :name, length: { minimum: 2, maximum: 30 }

  # Association validations
  validates_presence_of :user

  # Return it System Estimate NITRO Equity
  def requested_equity(formatted=false)
    # Initializers
    base_equity = 15
    amount_attrs = 0
    points_rate = 1000
    full_percent = 100
    amount_filled_attrs = 0
    variable_equity = full_percent - base_equity
    associations = [:idea, :market, :revenue, :project, :financial, :traction, :supporter, :business, :investment, :competitor]

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

    # Calc it final equity requested
    equity = base_equity + additional_equity
    equity = 100 if equity > 100

    # TODO Stage addition percent


    formatted ? equity.to_s.to_percent_formatter : equity
  end
end