class AdStepsController < ApplicationController
  include Wicked::Wizard
  steps :image_step, :phone_step

  def show
    @ad = Ad.find(params[:ad])
    render_wizard
  end


  def update

    # @ad = Ad.find(params.require(:ad).permit(:id))
    @ad = Ad.find(params[:ad_id])
    @ad.images.attach(params[:ad][:images])
    # if @ad.images.attached?
    #   puts "attached"
    # end
    # if ((params[:ad]).present?)
    #   @ad.images.attach(params[:ad][:images])
    # end
    render_wizard(@ad, {}, ad: @ad)
  end
end
