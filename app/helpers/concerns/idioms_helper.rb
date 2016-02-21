module Concerns::IdiomsHelper
# Return the Idioms ISO Code List
  def idioms
    idioms_list = []
    idioms_code = [:en, :pt, :es, :fr, :it, :de]

    idioms_code.each do |idiom_code|
      idioms_list << [t_idiom(idiom_code), idiom_code]
    end

    idioms_list
  end

  # Translate it idiom name
  def t_idiom(locale)
    t("idioms.#{locale.to_s}")
  end
end