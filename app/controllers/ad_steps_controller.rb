class AdStepsController < ApplicationController
  include Wicked::Wizard
  steps :image_step, :phone_step

  def show
    @ad = Ad.find(params[:ad])
    render_wizard
  end

  def update
    @ad = Ad.find(params[:ad_id])
    case step
      when :image_step
        if ((params[:ad]).present?)
          @ad.images.attach(params[:ad][:images])
          render_wizard(@ad,{},ad: @ad)
        end
      when :phone_step
        @ad.update(ad_params)
        redirect_to @ad
    end
  end

  private

  def ad_params
    params.require(:ad).permit(:primary_contact, :secondary_contact)
  end
end

