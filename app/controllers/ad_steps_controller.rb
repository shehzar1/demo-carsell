class AdStepsController < ApplicationController
  include Wicked::Wizard

  before_action :set_ad, only: %i[show update destroy]

  steps :image_step, :phone_step

  def show
    render_wizard
  end

  def update
    case step
      when :image_step
        if @ad.images.attach(ad_images_params[:images])
          render_wizard(@ad, {}, ad_id: @ad)
        else
          redirect_to ad_steps_url(:image_step, ad_id: @ad.id), alert: @ad.errors.full_messages.to_sentence
        end
      when :phone_step
        @ad.update(ad_params)
        if (@ad.errors.any?)
          flash[:alert] = @ad.errors.full_messages.to_sentence
          render_wizard(@ad,{},ad_id: @ad) and return
        end
        redirect_to @ad
    end
  end

  def destroy
    @img = @ad.images.find(params[:picture])
    @img.purge
    redirect_to ad_steps_url(:image_step, ad_id: @ad), alert: "Image deleted successfully"
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
end

