class AddCloseStatusToAds < ActiveRecord::Migration[6.1]
  def change
    add_column :ads, :close_status, :boolean, :default => false
  end
end
