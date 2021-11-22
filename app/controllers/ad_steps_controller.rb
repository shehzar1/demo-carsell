class AdStepsController < ApplicationController
  include Wicked::Wizard

  before_action :current_ad, only: %i[show update]

  steps :image_step, :phone_step

  def show
    render_wizard
  end

  def update
    @ad.images.attach(params[:ad_id][:images])
    render_wizard(@ad,{},ad: @ad)
  end

  def current_ad
    @ad = Ad.find(params[:ad_id])
  end

end

