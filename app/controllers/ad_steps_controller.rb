class AdStepsController < ApplicationController
  include Wicked::Wizard
  steps :image, :phone

  def show
    @ad = Ad.find(params[:id])
    render_wizard
  end

  def update
    @ad = Ad.find(params[:id])
    if @ad.update(ad_params)

    else
    end
  end

end
