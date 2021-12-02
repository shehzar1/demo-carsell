class AdStepsController < ApplicationController
  include Wicked::Wizard
  include AdSteps

  before_action :set_ad, only: %i[show update destroy]

  steps :image_step, :phone_step

  def show
    render_wizard
  end

  def update
    case step
      when :image_step
        image_step(@ad, ad_images_params)
      when :phone_step
        phone_step(@ad, ad_params)
    end
  end

  def destroy
    @img = @ad.images.find(params[:picture])
    @img.purge
    redirect_to ad_steps_path(:image_step, ad_id: @ad), alert: "Image deleted successfully"
  end

  def set_ad
    @ad = Ad.find(params[:ad_id])
  end

  def ad_images_params
    params.require(:ad).permit(images: [])
  end

  private

  def ad_params
    params.require(:ad).permit(:primary_contact, :secondary_contact)
  end

  def set_ad
    @ad = Ad.find(params[:ad_id])
  end

  def ad_images_params
    params.require(:ad).permit(images: [])
  end
end
