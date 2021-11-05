class AdStepsController < ApplicationController
  include Wicked::Wizard
  steps :image, :phone

  def show
    # @ad = Ad.find(params[:id])
    render_wizard
  end

end
