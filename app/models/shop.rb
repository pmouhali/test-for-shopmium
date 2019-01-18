class Shop < ApplicationRecord
	validates_uniqueness_of :latitude
	validates_uniqueness_of :longitude
end
