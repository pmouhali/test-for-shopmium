task import_shops: :environment do
  require 'csv'
  file = CSV.read("./vendor/shops_shopmium.csv", {headers: true})
    file.each do |l|
      if Shop.find_by(latitude: l[2], longitude: l[3], address: l[4], phone: l[8]).nil?
        shop = Shop.new
        shop.chain = l[0]
        shop.name = l[1]
        shop.latitude = l[2]
        shop.longitude = l[3]
        shop.address = l[4]
        shop.city = l[5]
        shop.zip = l[6]
        shop.phone = l[8]
        shop.country_code = l[18]
        shop.save
      end
    end
end