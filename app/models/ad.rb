class Ad < ApplicationRecord
  include PgSearch::Model

  has_many_attached :images
  has_many :favorites
  has_many :users, through: :favorites

  pg_search_scope :search_ads, against: [:city, :milage, :car_make, :price, :engine_type, :transmission_type, :engine_capacity, :color, :assembly_type, :description]

  CITIES = ['Rawalpindi', 'Lahore', 'Quetta', 'Karachi', 'Peshawar', 'Islamabad'].freeze
  MAKE = ['Suzuki', 'Toyota', 'Honda', 'BMW'].freeze
  ENGINE = ['Petrol', 'Diesel', 'Hybrid'].freeze
  TRANSMISSION = ['Automatic', 'Manual'].freeze
  ASSEMBLY = ['Local', 'Imported'].freeze
  COLOR = ['Black' ,'White', 'Other'].freeze
  PER_PAGE_COUNT = 4.freeze
  PHONE_REGEX = /^((\+92))-{0,1}\d{3}-{0,1}\d{7}$/.freeze

  def self.search(var, params)
    @ads=var.all
    @ads = search_ads(params[:city])if(params[:city].present?)
    @ads = search_ads(params[:milage])if(params[:milage].present?)
    @ads = search_ads(params[:car_make])if(params[:car_make].present?)
    @ads = search_ads(params[:price])if(params[:price].present?)
    @ads = search_ads(params[:engine_type])if(params[:engine_type].present?)
    @ads = search_ads(params[:transmission_type])if(params[:transmission_type].present?)
    @ads = search_ads(params[:engine_capacity])if(params[:engine_capacity].present?)
    @ads = search_ads(params[:color])if(params[:color].present?)
    @ads = search_ads(params[:assembly_type])if(params[:assembly_type].present?)
    @ads = search_ads(params[:description])if(params[:description].present?)
    return @ads
  end
end
