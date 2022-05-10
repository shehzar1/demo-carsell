class UserController < ApplicationController
  def favorites
    @pagy, @ads = pagy(current_user.favorite_ads, items: Ad::PER_PAGE_COUNT)
  end

  def ads
    @pagy, @ads = pagy(current_user.ads, items: Ad::PER_PAGE_COUNT)
  end
end
