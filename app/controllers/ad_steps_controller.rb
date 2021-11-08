class AdStepsController < ApplicationController
  include Wicked::Wizard
  steps :image_step, :phone_step

  def show
    @ad = Ad.find(params[:ad])
    render_wizard
  end

  def update
    @ad = Ad.find(params[:ad_id])
    if ((params[:ad]).present?)
      @ad.images.attach(params[:ad][:images])
    end
    render_wizard(@ad,{},ad: @ad)
  end

end

