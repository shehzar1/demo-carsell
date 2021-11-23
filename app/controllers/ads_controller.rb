class AdsController < ApplicationController
  before_action :current_ad, only: %i[show edit update destroy]

  def index
    @pagy, @ads = pagy(Ad.search(params[:search]), items: Ad::PER_PAGE_COUNT)
  end

  def show; end

  def new
    @ad = Ad.new
  end

  def create
    @ad = Ad.create(ad_params)

    if @ad.save
      redirect_to ad_steps_url(:image_step, ad: @ad), notice: "Ad created successfully."
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @ad.update(ad_params)
      redirect_to @ad, notice: "Ad updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    if @ad.destroy
      flash[:notice] = "Ad deleted successfully."
    else
      flash[:alert] = @ad.errors.full_messages.to_sentence
    end

    redirect_to ads_path
  end

  def favorites
    @pagy, @ads = pagy(Ad.all, items: Ad::PER_PAGE_COUNT)
  end

  private

  def current_ad
    @ad = Ad.find(params[:id])
  end

  private

  def ad_params
    params.require(:ad).permit(:city, :milage, :car_make, :price, :engine_type, :transmission_type, :engine_capacity, :color, :assembly_type, :description, :primary_contact, :secondary_contact, images: [])
  end
end
