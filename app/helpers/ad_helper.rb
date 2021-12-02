def favorite_button(ad, user)
  return 'Already Fav' if ad.favorite_by?(user)

  link_to("Fav", favorites_path(ad_id: ad), class:"btn btn-outline-danger btn-sm")
end
