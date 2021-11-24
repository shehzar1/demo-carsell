class ChargesController < ApplicationController
  before_action :authenticate_user!

  def new; end

  def create
    payment = PaymentService.new(payment_params)
    payment.process
    if payment.success?
      @featured_ad = Ad.find_by(id: params[:ad_id])
      @featured_ad.update_attribute(:featured, true)
      redirect_to ad_step_path(:phone_step, ad_id: params[:ad_id])
    else
      redirect_to new_charges_path, alert: payment.error_message
    end
  end

  private

  def payment_params
    params.permit(:stripeEmail, :stripeToken, :authenticity_token, :stripeTokenType, :ad_id)
  end
end
