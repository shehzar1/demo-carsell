class PaymentService
  attr_accessor :email, :source, :charge, :customer, :error_message

  def initialize(payment_params)
    self.email = payment_params[:stripeEmail]
    self.source = payment_params[:stripeToken]
    @description = Ad::DESCRIPTION
    @amount = Ad::AMOUNT
    @currency = Ad::CURRENCY
  end

  def process
    create_customer
    create_charge

  rescue Stripe::CardError => e
    failure_response(e.message)
  end

  def create_customer
    customer = Stripe::Customer.create(
      email: email,
      source: source
    )
  end

  def create_charge
    charge = Stripe::Charge.create(
      customer: @customer.id,
      amount: @amount,
      description: @description,
      currency: @currency
    )
  end

  def failure_response(message)
    error_message = message
  end

  def success?
    customer.present? && charge.present? && error_message.blank?
  end
end
