class FavoritesController < ApplicationController
  before_action :set_ad, only: :destroy
  before_action :authenticate_user!

  def create
    favorite = current_user.favorites.build(ad_id: params[:ad_id])
    if favorite.save
      flash[:notice] = "Added to Favorites"
    else
      flash[:alert] = @ad.errors.full_messages.to_sentence

    redirect_back fallback_location: ads_path
  end

  def destroy
    @favorite.destroy
    if @favorite.destroyed?
      flash[:notice] = "Ad removed from Favorites."
    else
      flash[:alert] = @ad.errors.full_messages.to_sentence

    redirect_back fallback_location: user_favorites_path
  end

  private

  def set_ad
    @favorite = current_user.favorites.find_by(ad_id: params[:id])
  end
end
