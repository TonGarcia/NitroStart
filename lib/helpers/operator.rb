module Helpers
  # Easy access Rails & other GEMs with a simple single call, not nested calls
  class Operator
    def self.status_msg(transaction)
      # AuxVars
      msg = ''
      states = []

      # Retrieve hash
      states << transaction[:autenticacao]
      states << transaction[:autorizacao]
      states << transaction[:captura]

      # SetUp the message
      states.each_with_index do |state, i|
        # Do not append to the msg if it is not a Hash
        next unless state.is_a?Hash
        i == 0 ? msg = state.to_json : msg = "#{msg}|#{state.to_json}"
      end

      msg.length == 0 ? {status:0, message:'created', time:Time.now}.to_json : msg
    end

    def self.add_cents(amount)
      cents_eval = 100
      return amount/cents_eval if amount.is_a?Integer
      Rents::Currency.to_operator_str(amount).to_i/cents_eval if amount.is_a?String
    end
  end
end