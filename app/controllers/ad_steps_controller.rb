class AdStepsController < ApplicationController
  include Wicked::Wizard

  before_action :current_ad, only: %i[show update]

  steps :image_step, :phone_step

  def show
    render_wizard
  end

  def update
    if @ad.images.attach(ad_images_params[:images])
      render_wizard(@ad, {}, ad_id: @ad)
    else
      redirect_to ad_steps_url(:image_step, ad_id: @ad.id), alert: @ad.errors.full_messages.to_sentence
    end
  end

  def current_ad
    @ad = Ad.find(params[:ad_id])
  end

  def ad_images_params
    params.require(:ad).permit(images: [])
  end
end
