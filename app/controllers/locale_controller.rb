class LocaleController < ApplicationController
  # GET /idiom_flags
  # GET /idiom_flags.json
  def idiom_flags
    # TODO add c.currency
    locale = params[:locale]
    @countries = ISO3166::Country.find_all_countries_by_languages(locale)

    # Brazil is PT-BR
    if locale == 'pt'
      @countries.unshift ISO3166::Country.find_all_countries_by_name('Brazil').first
    end

    render layout: 'blank'
  end
end
