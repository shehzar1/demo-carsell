class AdStepsController < ApplicationController
  include Wicked::Wizard

  before_action :current_ad, only: %i[show update]

  steps :image_step, :phone_step

  def show
    render_wizard
  end

  def update
    if params.dig(:ad, :images).present?
      img_count = @ad.images.count
      @ad.images.attach(ad_images_params[:images])
      redirect_to ad_steps_url(:image_step, ad_id: @ad.id), alert: "No new image attached: Please try again." and return if img_count >= @ad.images.count
    end
    render_wizard(@ad, {}, ad_id: @ad)
  end

  def current_ad
    @ad = Ad.find(params[:ad_id])
  end

  def ad_images_params
    params.require(:ad).permit(images: [])
  end
end
