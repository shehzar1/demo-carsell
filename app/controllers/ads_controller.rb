class AdsController < ApplicationController
  before_action :set_ad, only: %i[show edit update destroy close]

  def index
    @pagy, @ads = pagy(Ad.search(params[:search]), items: Ad::PER_PAGE_COUNT)
    @ads = @ads.includes(:favorites, users: :favorite_ads)
  end

  def show; end

  def new
    @ad = Ad.new
  end

  def create
    @ad = Ad.create(ad_params)
    @ad.user_id = current_user.id
    if @ad.save
      redirect_to ad_steps_url(:image_step, ad_id: @ad.id), notice: "Ad created successfully."
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @ad.update(ad_params)
      redirect_to ad_steps_url(:image_step, ad_id: @ad)
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

  def close
    if @ad.update(close_status: true)
      flash[:notice] = "Ad Closed successfully"
    else
      flash[:alert] = @ad.errors.full_messages.to_sentence
    end

    redirect_to user_ads_ads_path
  end

  private

  def set_ad
    @ad = Ad.find(params[:id])
  end

  private

  def ad_params
    params.require(:ad).permit(:city, :milage, :car_make, :price, :engine_type, :transmission_type, :engine_capacity, :color, :assembly_type, :description, :primary_contact, :secondary_contact, :user_id, :close_status, images: [])
  end
end
