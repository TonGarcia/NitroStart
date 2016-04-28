class CallbacksController < ApplicationController
  def checkout
    # Check it campaign based on the :checkout_id
    @campaign = Campaign.where(checkout_id: params[:cid]).take

    # Check it payment status
    transaction = NitroPay::Transaction.new tid: params[:tid]
    payment_info = transaction.verify
    payment_customers = payment_info[:customers]

    # Update user based on it supporter infos
    if payment_info[:uid] && @supporter = Supporter.where(id: payment_info[:uid]).take
      @supporter_user = @supporter.user
      payment_customers.is_a?(Array) ? customer = payment_customers.first : customer = payment_customers

      # Update it supporter user attributes
      @supporter_user.legal_id = customer[:legal_id]
      @supporter_user.zip_code = customer[:zip_code]
      @supporter_user.save
      supporter_id = @supporter.id
    else
      supporter_id = nil
    end

    # Register it Customer Funding
    customer_funding_params = {
      # Base Attributes
      tid: payment_info[:tid].to_i,
      status: payment_info[:status],
      amount: payment_info[:amount],
      response: payment_info.to_json,
      payment_method: payment_info[:payment_method],

      # Association Attributes
      user_id: @current_user.id,
      pitch_id: @campaign.pitch_id,
      campaign_id: @campaign.id,
      supporter_id: supporter_id
    }

    # Persist it funding
    transaction_funding = CustomerFunding.create customer_funding_params

    case payment_info[:status].to_sym
      when :charged
        redirect_to showroom_pitches_path, notice: 'Aquisição de Créditos Efetuada com Sucesso'
      when :pending
        redirect_to showroom_pitches_path, notice: 'Aquisição de Crédito Pendente. Aguarde 1 dia e caso não seja efetuada verifique com seu banco'
      when :error
        # TODO add adquirir novos créditos para um mesmo apoio já prestado
        # msg = 'A Aquisição de Crédito falhou. Tente novamente.'
    end
  end
end