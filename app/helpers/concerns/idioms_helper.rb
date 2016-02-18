module Concerns::IdiomsHelper
# Return the Idioms ISO Code List
  def idioms
    idioms_code = [:en, :pt, :es, :fr, :it, :de]
    idioms_list = []

    idioms_code.each do |idiom_code|
      idioms_list << [t("idioms.#{idiom_code.to_s}"), idiom_code]
    end

    idioms_list
  end
end