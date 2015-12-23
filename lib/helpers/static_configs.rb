module Helpers
  # ShortCuts to access YMLs LIKE translate (i18/locales)
  class StaticConfigs
    # Easy access translate file
    def self.translates locale=nil
      locale = locale.to_sym if locale.is_a? String
      return I18n.backend.send(:translations)[I18n.locale] if locale.nil?
      return I18n.backend.send(:translations)[locale]
    end

    # ShortCut to access transaction_code translator
    def self.translate_transaction status_code
      Helpers::StaticConfigs.translates[:card_operators][:cielo][:transaction_code][status_code]
    end
  end
end