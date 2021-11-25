class PaymentService
  attr_accessor :email, :source, :charge, :customer, :error_message

  def initialize(payment_params)
    email = payment_params[:stripeEmail]
    source = payment_params[:stripeToken]
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
      customer: customer.id,
      amount: Ad::AMOUNT,
      description: Ad::DESCRIPTION,
      currency: Ad::CURRENCY
    )
  end

  def failure_response(message)
    error_message = message
  end

  def success?
    customer.present? && charge.present? && error_message.blank?
  end
end
