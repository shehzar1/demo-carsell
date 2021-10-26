class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, format: {with: /\(?[0-9]{3}\)?-[0-9]{3}-[0-9]{4}/}
  # validates :first_name,:last_name, presence: true ,length: { minimum: 2 },format: { with: /\A[a-zA-Z]+\z/, message: “only allows letters” }
  # validates :phone_number, format: {with: /\(?[0-9]{3}\)?-[0-9]{3}-[0-9]{4}/, message: “Phone numbers must be in xxx-xxx-xxxx format.“}
  validates :password, format: {with: /(?=.*?[A-Z])(?=(.*[a-z]){1,})(?=(.*[\d]){1,})(?=(.*[\W]){1,})(?!.*\s).{8,}/,message: " -Password must contain at least (1) special characters. Password must contain at least (1) uppercase letter. Password must be at least 8 characters long."}
end
