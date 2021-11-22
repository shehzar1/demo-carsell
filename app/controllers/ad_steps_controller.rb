class AdStepsController < ApplicationController
  include Wicked::Wizard

  before_action :current_ad, only: %i[show update]

  steps :image_step, :phone_step

  def show
    render_wizard
  end

  def update
    @ad.images.attach(ad_images_params[:images]) if params.dig(:ad,:images).present?
    render_wizard(@ad,{},ad_id: @ad)
  end

  def current_ad
    @ad = Ad.find(params[:ad_id])
  end

  def ad_images_params
    params.require(:ad).permit(images: [])
  end
end
