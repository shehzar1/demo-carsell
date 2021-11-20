class AdStepsController < ApplicationController
  include Wicked::Wizard

  before_action :current_ad, only: %i[show update]

  steps :image_step, :phone_step

  def show
    render_wizard
  end

  def update
    @ad.images.attach(params[:ad][:images])
    render_wizard(@ad,{},ad: @ad)
  end

  def current_ad
    @ad = Ad.find(params[:id])
  end

end

