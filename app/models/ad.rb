class Ad < ApplicationRecord
  include PgSearch::Model

  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
  belongs_to :user
  has_many_attached :images
  has_rich_text :description

  pg_search_scope :search_ads, lambda { |key, query| [:city, :milage, :car_make, :price, :engine_type, :transmission_type, :engine_capacity, :color, :assembly_type, :description].include?(key)
    {
      against: key,
      query: query
    }
  }

  CITIES = ['Rawalpindi', 'Lahore', 'Quetta', 'Karachi', 'Peshawar', 'Islamabad'].freeze
  MAKE = ['Suzuki', 'Toyota', 'Honda', 'BMW'].freeze
  ENGINE = ['Petrol', 'Diesel', 'Hybrid'].freeze
  TRANSMISSION = ['Automatic', 'Manual'].freeze
  ASSEMBLY = ['Local', 'Imported'].freeze
  COLOR = ['Black' ,'White', 'Other'].freeze
  PER_PAGE_COUNT = 4.freeze
  PHONE_REGEX = /^((\+92))-{0,1}\d{3}-{0,1}\d{7}$/.freeze

  def self.search(query_hash)
    scope = Ad.all
    query_hash.compact_blank.each { |key, value| scope = scope.search_ads(key, value) } if query_hash.present?

    scope
  end
end
