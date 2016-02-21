# Capability Formatting attributes to be displayed on view
module Viewer
  extend ActiveSupport::Concern

  # Convert it locale into Flag img string
  def locale_flags
    encode_flags = '<div class="f32 flags">'
    countries = self.locale_countries

    ApplicationController.helpers.flag_list(32) do
      countries.each do |country|
        encode_flags = encode_flags + ApplicationController.helpers.flag(country.alpha2.downcase.to_sym, title: country.translations['pt'], class: 'col')
      end
    end

    encode_flags + '</div>'
  end
end