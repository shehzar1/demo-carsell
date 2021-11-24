class PaymentService
  def initialize(payment_params)
    @email = payment_params[:stripeEmail]
    @source = payment_params[:stripeToken]
    @description = set_description
    @amount = set_amount
    @currency = set_currency
  end

  def process
    create_customer
    create_charge

  rescue Stripe::CardError => e
    failure_response(e.message)
  end

  def create_customer
    @customer = Stripe::Customer.create(
      email: @email,
      source: @source
    )
  end

  def create_charge
    @charge = Stripe::Charge.create(
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

  def set_amount
    10000
  end

  def set_description
    "Feature Ad"
  end

  def set_currency
    "pkr"
  end
end
