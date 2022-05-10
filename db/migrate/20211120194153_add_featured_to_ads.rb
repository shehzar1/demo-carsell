class AddFeaturedToAds < ActiveRecord::Migration[6.1]
  def change
    add_column :ads, :featured, :boolean
  end
end
