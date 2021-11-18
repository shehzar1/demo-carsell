class Ad < ApplicationRecord
  include PgSearch::Model

  has_many_attached :images
  has_many :favorites
  has_many :users, through: :favorites
  has_rich_text :description

  pg_search_scope :search_ads, against: [:city, :milage, :car_make, :price, :engine_type, :transmission_type, :engine_capacity, :color, :assembly_type, :description]

  CITIES = ['Rawalpindi', 'Lahore', 'Quetta', 'Karachi', 'Peshawar', 'Islamabad'].freeze
  MAKE = ['Suzuki', 'Toyota', 'Honda', 'BMW'].freeze
  ENGINE = ['Petrol', 'Diesel', 'Hybrid'].freeze
  TRANSMISSION = ['Automatic', 'Manual'].freeze
  ASSEMBLY = ['Local', 'Imported'].freeze
  COLOR = ['Black' ,'White', 'Other'].freeze
  PER_PAGE_COUNT = 4.freeze
  PHONE_REGEX = /^((\+92)?(0092)?(92)?(0)?)(3)([0-9]{9})/.freeze

  # validate :validate_images
  validates :images, length: { maximum: 5 , message: "cannot be more than 5 for an ad." }
  validates :city, inclusion: { in: CITIES, message: "%{value} is invalid" }
  validates :car_make, inclusion: { in: MAKE, message: "%{value} is invalid" }
  validates :transmission_type, inclusion: { in: TRANSMISSION, message: "%{value} is invalid" }
  validates :engine_type, inclusion: { in: ENGINE, message: "%{value} is invalid" }
  # validates :color, presence: true
  validates :assembly_type, inclusion: { in:  ASSEMBLY, message: "%{value} is invalid" }
  validates :primary_contact, format: {with: PHONE_REGEX, message: "format should be +92-3XX-XXXXXXX", multiline: true}, allow_blank: true
  validates :secondary_contact, format: {with: PHONE_REGEX, message: "format should be +92-3XX-XXXXXXX", multiline: true}, allow_blank: true
  validates :milage, numericality: {only_integer: false}, presence: true
  validates :price, numericality: {only_integer: false}, presence: true
  validates :engine_capacity, numericality: {only_integer: false}, presence: true

  # private

  # def validate_images
  #   return if images.count < 6
  #   errors.add(:images, 'You cannot upload more than 5 for an ad.')
  # end
end
