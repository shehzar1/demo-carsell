class PaymentService

  def initialize(email, source, amount, description, currency)
    @email = email
    @source = source
    @amount = amount
    @description = description
    @currency = currency
  end

  def create_payment
    customer = Stripe::Customer.create(
      email: @email,
      source: @source
    )
    Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: @description,
      currency: @currency
    )
  end
end
