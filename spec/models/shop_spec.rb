require 'rails_helper'

RSpec.describe Shop, type: :model do
  
  subject { Shop.new(name: "Shopmium poissy", address: "119 rue du General de Gaulle",
  	city: "Poissy", zip: "78300", chain: "Shopmium", country_code: "fr", 
  	phone: "0130068308", latitude: "48.92820769999999", longitude: "2.0446661")
    }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end  

  context 'when a parameter is missing' do  
    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an address" do
      subject.address = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a city" do
      subject.city = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a zip code" do
      subject.zip = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a chain" do
      subject.chain = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a country_code" do
      subject.country_code = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a phone number" do
      subject.phone = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a latitude" do
      subject.latitude = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a longitude" do
      subject.longitude = nil
      expect(subject).to_not be_valid
    end
  end

  context 'when a parameter is invalid' do
  	it "is not valid with name too short" do
  	  subject.name = "Shop"
  	  expect(subject).to_not be_valid
  	end

  	it "is not valid with address too short" do
  	  subject.address = "Paris"
  	  expect(subject).to_not be_valid
  	end

  	it "is not valid with invalid address" do
  	  subject.address = "85 School Ave. Tulare"
  	  expect(subject).to_not be_valid
  	end

	it "is not valid with invalid zip lenght" do
	  subject.zip = "75"
	  expect(subject).to_not be_valid
	end

	it "is not valid with invalid zip lenght" do
	  subject.zip = "7500199"
	  expect(subject).to_not be_valid
	end

	it "is not valid with invalid phone lenght" do
	  subject.phone = "01300683"
	  expect(subject).to_not be_valid
	end

	it "is not valid with invalid phone lenght" do
	  subject.phone = "01300683088"
	  expect(subject).to_not be_valid
	end

	it "is not valid with invalid latitude format" do
	  subject.latitude = "01300683088"
	  expect(subject).to_not be_valid
	end

	it "is not valid with invalid longitude format" do
	  subject.longitude = "2.a009"
	  expect(subject).to_not be_valid
	end

	it "is not valid with invalid latitude & longitude" do
	  subject.latitude = "35.8810093"
	  subject.longitude = "-119.2687108"
	  expect(subject).to_not be_valid
	end
  end
end