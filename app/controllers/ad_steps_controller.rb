class AdStepsController < ApplicationController
  include Wicked::Wizard

  before_action :current_ad, only: %i[show update]

  steps :image_step, :phone_step

  def show
    render_wizard
  end

  def update
    if ((params[:ad]).present?)
      @ad.images.attach(params.dig(:ad,:images))
    end
    render_wizard(@ad,{},ad_id: @ad)
  end

  def current_ad
    @ad = Ad.find(params[:ad_id])
  end

end

