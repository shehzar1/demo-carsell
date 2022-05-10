class AddContactsToAds < ActiveRecord::Migration[6.1]
  def change
    add_column :ads, :primary_contact, :string
    add_column :ads, :secondary_contact, :string
  end
end
