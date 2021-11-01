class AdsController < ApplicationController
  before_action :current_ad, only: [:show, :edit, :update, :destroy]

  def index
    @ads = Ad.all
  end

  def show; end

  def new
    @ad = Ad.new
  end

  def create
    ad = Ad.create(ad_params)
    redirect_to ad_path(ad)
  end

  def edit; end

  def update
    @ad.update(ad_params)
    redirect_to ad_path(@ad)
  end

  def destroy
    @ad.destroy
    redirect_to ads_path
  end

  private

  def current_ad
    @ad = Ad.find(params[:id])
  end

  private

  def ad_params
    params.require(:ad).permit(:city, :milage, :car_make,:price,:engine_type,:transmission_type,:engine_capacity ,:color, :assembly_type, :description)
  end
end
