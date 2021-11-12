class AdsController < ApplicationController
  before_action :current_ad, only: %i[show edit update destroy close]

  def index
    @pagy, @ads = pagy(Ad.where(close_status: false), items: Ad::PER_PAGE_COUNT)
    @ads = @ads.all.search_ads(params[:city])if(params[:city].present?)
    @ads = @ads.all.search_ads(params[:milage])if(params[:milage].present?)
    @ads = @ads.all.search_ads(params[:car_make])if(params[:car_make].present?)
    @ads = @ads.all.search_ads(params[:price])if(params[:price].present?)
    @ads = @ads.all.search_ads(params[:engine_type])if(params[:engine_type].present?)
    @ads = @ads.all.search_ads(params[:transmission_type])if(params[:transmission_type].present?)
    @ads = @ads.all.search_ads(params[:engine_capacity])if(params[:engine_capacity].present?)
    @ads = @ads.all.search_ads(params[:color])if(params[:color].present?)
    @ads = @ads.all.search_ads(params[:assembly_type])if(params[:assembly_type].present?)
    @ads = @ads.all.search_ads(params[:description])if(params[:description].present?)
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
    if user_signed_in?
      fav = Favorite.new()
      fav.user_id = current_user.id
      fav.ad_id = params[:id]
      if fav.save
        flash[:notice] = "Ad added to Favorites"
      else
        flash[:alert] = @ad.errors.full_messages.to_sentence
      end

      redirect_to ads_path
    else
      redirect_to new_user_registration_path, notice: "Please login first"
    end
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
    current_user.favorites.each do |f|
      @ads << f.ad
    end
    @pagy, @ads = pagy_array(@ads, items: Ad::PER_PAGE_COUNT)
  end

  def myposts
    @ads = Ad.all.where(user_id: current_user)
    @pagy, @ads = pagy(@ads, items: Ad::PER_PAGE_COUNT)
  end

  def close
    if @ad.update_attribute(:close_status, true)
      flash[:notice] = "Ad Closed successfully"
    else
      flash[:alert] = @ad.errors.full_messages.to_sentence
    end

    redirect_to myposts_ads_path
  end

  private

  def current_ad
    @ad = Ad.find(params[:id])
  end

  private

  def ad_params
    params.require(:ad).permit(:city, :milage, :car_make, :price, :engine_type, :transmission_type, :engine_capacity, :color, :assembly_type, :description, :primary_contact, :secondary_contact, :user_id, :close_status, images: [])
  end
end
