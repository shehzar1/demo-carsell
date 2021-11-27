class AdsController < ApplicationController
  before_action :set_ad, only: %i[show edit update destroy close]

  def index
    @pagy, @ads = pagy(Ad.search(params[:search]), items: Ad::PER_PAGE_COUNT)
  end

  def show; end

  def new
    @ad = Ad.new
  end

  def create
    @ad = Ad.create(ad_params)
    @ad.user_id = current_user.id
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
    redirect_to new_user_registration_path, notice: "Please login first" unless user_signed_in?

    if @ad.favorite(current_user, params[:id])
      flash[:notice] = "Ad added to Favorites"
    else
      flash[:alert] = @ad.errors.full_messages.to_sentence
    end

    redirect_to ads_path
  end

  def unfavorite
    if Favorite.where(ad_id: params[:id]).destroy_all
      flash[:notice] = "Ad removed from Favorites."
    else
      flash[:alert] = @ad.errors.full_messages.to_sentence
    end

    redirect_to myfavorites_ads_path
  end


  def myfavorites
     @ads = Array.new()
     current_user.favorites.each do |f| @ads << f.ad end
     @pagy, @ads = pagy_array(@ads, items: Ad::PER_PAGE_COUNT)
  end

  def myposts
    redirect_to new_user_registration_path, notice: "Please login first" unless user_signed_in?

    @ads = Ad.where(user_id: current_user)
    @pagy, @ads = pagy(@ads, items: Ad::PER_PAGE_COUNT)
  end

  def close
    if @ad.update(close_status: true)
      flash[:notice] = "Ad Closed successfully"
    else
      flash[:alert] = @ad.errors.full_messages.to_sentence
    end

    redirect_to myposts_ads_path
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
