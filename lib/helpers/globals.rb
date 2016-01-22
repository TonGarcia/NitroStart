module Helpers
  # Global & testable data creator
  class Globals
    # Get it Global App
    def self.app
      app = App.first
      admin_user = User.first
      admin_user.password_rechecked=true
      {id:app.id, secret:app.secret_key(admin_user)}
    end

    # Create a Global Subscription
    def self.subscription
      # Try to get the recurrent purchase
      app = App.first
      denied_code = Helpers::Enum.find(:transaction_code, :tag, 'not_authorized')[:index]
      query = "purchases.recurrence_period IS NOT NULL AND bank_transactions.status_code != #{denied_code}"
      recurrent_purchase = app.purchases.joins(:bank_transactions).where(query).take
      return recurrent_purchase if recurrent_purchase

      # Prepare the transaction
      purchase = Purchase.new(purchase_params)
      recurrent_period = ENUM[:recurrence_periods][:monthly]
      resp = purchase.charge(transaction_params(recurrent_period), clients=[], :store)

      if resp[:errors]
        puts resp[:errors]
        return Purchase.new
      end

      # SetUp errors message
      bank_transaction = purchase.bank_transactions.last
      msg = purchase.errors if purchase.id.nil?
      msg = bank_transaction.errors if bank_transaction.id.nil?

      msg ? {errors: msg} : purchase
    end

    # Help internal methods
    private
      def self.create_url(env_url, path)
        # Create the URL
        env_url = env_url[0..env_url.length-2] if env_url.last == '/'
        "#{env_url}#{path}"
      end

      def self.create_request_params(recurrent_period=nil)
        # If there isn't any valid recurrent_purchase, create a new one
        amount = Random.rand(99999).to_s
        amount = "#{amount}00" if amount[amount.length-2, amount.length] != '00'
        card = Helpers::Enum.find(:cards, :id, 1)
        app = Helpers::Globals.app
        expiration = DateTime.parse(card[:expiration])

        # create the transaction params
        transaction_params = {
          card: {
            cvv: card[:cvv],
            brand: card[:brand],
            number: card[:number],
            expiration_month: expiration.month,
            expiration_year: expiration.year,
            holder: Faker::Name.name
          },
          recurrence_period: recurrent_period,
          amount: amount
        }

        # The full request params
        {
          auth: {
            app_id: app[:id],
            secret_key: app[:secret],
          },
          app_id: app[:id],
          transaction: transaction_params
        }
      end

      def self.purchase_params
        app = Helpers::Globals.app
        amount = Random.rand(99999).to_s
        recurrent_period=ENUM[:recurrence_periods][:monthly]
        amount = "#{amount}00" if amount[amount.length-2, amount.length] != '00'

        {
            amount: amount,
            app_id: app[:id],
            recurrence_period: recurrent_period
        }
      end

      def self.transaction_params recurrent_period=nil
        # If there isn't any valid recurrent_purchase, create a new one
        amount = Random.rand(99999).to_s
        amount = "#{amount}00" if amount[amount.length-2, amount.length] != '00'
        card = Helpers::Enum.find(:cards, :id, 1)
        expiration = DateTime.parse(card[:expiration])

        # create the transaction params
        {
          card: {
            cvv: card[:cvv],
            brand: card[:brand],
            number: card[:number],
            expiration_month: expiration.month,
            expiration_year: expiration.year,
            holder: Faker::Name.name
          },
          recurrence_period: recurrent_period,
          amount: amount
        }
      end
  end
end