task import_shops: :environment do
  require 'csv'
  file = CSV.read("./vendor/shops_shopmium.csv")
    file.each do |l|
      shop = Shop.new
      shop.chain = l[0]
      shop.name = l[1]
      shop.latitude = l[2].to_f
      shop.longitude = l[3].to_f
      shop.address = l[4]
      shop.city = l[5]
      shop.zip = l[6].to_i
      shop.phone = l[8].to_i
      shop.country_code = l[18]
      shop.save
    end
end