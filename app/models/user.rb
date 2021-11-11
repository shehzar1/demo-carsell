class User < ApplicationRecord
  has_many :favorites
  has_many :ads, through: :favorites

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true, format: {with: /(?:\d{10}|\w+@\w+\.\w{2,3})/}
  validates :username, uniqueness: true, presence: true, length: {maximum: 30, minimum: 2}
  validates :password, format: {with: /(?=.*?[A-Z])(?=(.*[a-z]){1,})(?=(.*[\d]){1,})(?=(.*[\W]){1,})(?!.*\s).{8,}/, message: " -Password must contain at least (1) special characters. Password must contain at least (1) uppercase letter. Password must be at least 8 characters long."}
end
