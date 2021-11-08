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
        end
      # when :phone_step
      #   @ad.update_attributes(:secondary_contact, :featured)
    end
    render_wizard(@ad,{},ad: @ad)
  end

end

