class PaymentService

  AMOUNT=100000.freeze

  def initialize(payment_params)
    @email = payment_params[:stripeEmail]
    @source = payment_params[:stripeToken]
    @description = set_description
    @amount = set_amount
    @currency = set_currency
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

  def payment
    {"customer": create_customer, "charge": create_charge}

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
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
