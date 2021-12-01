class FavoritesController < ApplicationController
  before_action :set_ad, only: :destroy
  before_action :authenticate_user!

  def create
    fav = current_user.favorites.build(ad_id: params[:ad_id])
    flash[:notice] = "Added to Favorites" if fav.save
    redirect_back fallback_location: ads_path
  end

  def destroy
    @fav.destroy
    flash[:notice] = "Ad removed from Favorites." if @fav.destroyed?
    redirect_back fallback_location: user_favorites_path
  end

  private

  def set_ad
    @fav = current_user.favorites.find_by(ad_id: params[:id])
  end
end
