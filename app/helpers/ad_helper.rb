module AdHelper
  def favorite_button(ad, user)
    return 'Already Fav' if ad.favorite_by?(user)

    link_to("Fav", favorites_path(ad_id: ad), method: :post, class:"btn btn-outline-danger btn-sm")
  end
end
