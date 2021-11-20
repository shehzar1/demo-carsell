class PaymentService

  def initialize(email, source, amount, description, currency)
    @email = email
    @source = source
    @amount = amount
    @description = description
    @currency = currency
  end

  def payment
    {"customer": create_customer, "charge": create_charge}
  end

  def create_customer
    @customer = Stripe::Customer.create(
    email: @email,
    source: @source
    )
  end

  def create_charge
    Stripe::Charge.create(
      customer: @customer.id,
      amount: @amount,
      description: @description,
      currency: @currency
    )
  end
end
