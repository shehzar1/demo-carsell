class ChargesController < ApplicationController
  before_action :authenticate_user!

  def new; end

  def create
    PaymentService.new(payment_params).payment
    @featured_ad = Ad.find_by(id: params[:ad_id])
    @featured_ad.update_attribute(:featured, true)
    redirect_to ad_step_path(:phone_step, ad_id: params[:ad_id])
  end

  private

  def payment_params
    params.permit(:stripeEmail, :stripeToken)
  end

end
