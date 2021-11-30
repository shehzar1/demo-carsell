class ChargesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ad, only: :create

  def new; end

  def create
    payment = PaymentService.new(payment_params)
    payment.process
    if payment.success?
      @featured_ad.update_attribute(:featured, true)
      redirect_to ad_step_path(:phone_step, @featured_ad.id)
    else
      redirect_to new_charge_path, alert: payment.error_message
    end
  end

  def set_ad
    @featured_ad = Ad.find_by(id: params[:ad_id])
  end

  private

  def payment_params
    params.permit(:stripeEmail, :stripeToken, :authenticity_token, :stripeTokenType, :ad_id)
  end
end
