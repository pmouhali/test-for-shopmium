class Shop < ApplicationRecord
	validates :name, length: { minimum: 8 }, presence: true
	validates :address, length: { minimum: 5 }, presence: true
	
	validates :latitude, length: { minimum: 4 }, 
	  presence: true, format: { with: /\A\-?\d+\.\d+\z/,
      message: "only allows geographic coordinates" }

  validates :longitude, length: { minimum: 4 }, 
   	presence: true, format: { with: /\A\-?\d+\.\d+\z/,
       message: "only allows geographic coordinates" }

  validates :city, presence: true
  validates :zip, presence: true, length: { is: 5}, numericality: { only_integer: true }
  validates :phone, presence: true, length: { is: 10}, numericality: { only_integer: true }
  validates :country_code, presence: true
end
