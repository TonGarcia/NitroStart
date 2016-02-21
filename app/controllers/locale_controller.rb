class LocaleController < ApplicationController
  # GET /idiom_flags
  # GET /idiom_flags.json
  def idiom_flags
    locale = params[:locale]
    @countries = Helpers::Globals.find_all_countries_by_languages(locale)
    render layout: 'blank'
  end
end