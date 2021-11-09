class Ad < ApplicationRecord
  include PgSearch::Model

  has_many_attached :images

  pg_search_scope :search_ads, against: [:city, :milage, :car_make, :price, :engine_type, :transmission_type, :engine_capacity, :color, :assembly_type, :description]

  CITIES = ['Rawalpindi', 'Lahore', 'Quetta', 'Karachi', 'Peshawar', 'Islamabad'].freeze
  MAKE = ['Suzuki', 'Toyota', 'Honda', 'BMW'].freeze
  ENGINE = ['Petrol', 'Diesel', 'Hybrid'].freeze
  TRANSMISSION = ['Automatic', 'Manual'].freeze
  ASSEMBLY = ['Local', 'Imported'].freeze
  COLOR = ['Black' ,'White'].freeze
  PER_PAGE_COUNT = 4.freeze
  PHONE_REGEX = /^((\+92))-{0,1}\d{3}-{0,1}\d{7}$/.freeze

  validates :primary_contact, format: {with: PHONE_REGEX, message: "format should be +92-3XX-XXXXXXX", multiline: true}, allow_blank: true
  validates :secondary_contact, format: {with: PHONE_REGEX, message: "format should be +92-3XX-XXXXXXX", multiline: true}, allow_blank: true
end
