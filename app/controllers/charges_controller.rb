class ChargesController < ApplicationController
  before_action :authenticate_user!, :amount_to_be_charged

  def new; end

  def create
    PaymentService.new(params[:stripeEmail], params[:stripeToken], @amount, @description, 'pkr').create_payment
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private

    def amount_to_be_charged
      @amount = 50000
    end

    def description
      @description = "Feature Ad"
    end
end
