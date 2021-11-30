class FavoritesController < ApplicationController
  before_action :set_ad, only: :destroy

  def create
    fav = current_user.favorites.build(ad_id: params[:ad_id])
    if fav.save
      flash[:notice] = "Ad added to Favorites"
    else
      flash[:alert] = @ad.errors.full_messages.to_sentence
    end

    redirect_to ads_path
  end

  def destroy
    @fav.destroy
    if @fav.destroyed?
      flash[:notice] = "Ad removed from Favorites."
    end

    redirect_to ads_path
  end

  private

  def set_ad
    @fav = current_user.favorites.find_by(ad_id: params[:id])
  end
end
