class FavoritesController < ApplicationController
  before_action :set_ad, only: :destroy
  before_action :authenticate_user!

  def create
    byebug

    favorite = current_user.favorite_users.build(ad_id: params[:ad_id])
    if favorite.save
      flash[:notice] = "Added to Favorites"
    else
      flash[:alert] = @ad.errors.full_messages.to_sentence
    end

    redirect_back fallback_location: ads_path
  end

  def destroy
    if @favorite.destroy
      flash[:notice] = "Ad removed from Favorites."
    else
      flash[:alert] = @ad.errors.full_messages.to_sentence
    end

    redirect_back fallback_location: user_favorites_path
  end

  private

  def set_ad
    @favorite = current_user.favorites.find_by(ad_id: params[:id])
  end
end
