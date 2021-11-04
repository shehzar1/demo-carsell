class CreateAds < ActiveRecord::Migration[6.1]
  def change
    create_table :ads do |t|
      t.string :city
      t.integer :milage
      t.string :car_make
      t.integer :price
      t.string :engine_type
      t.string :transmission_type
      t.integer :engine_capacity
      t.string :color
      t.string :assembly_type
      t.text :description

      t.timestamps
    end
  end
end
