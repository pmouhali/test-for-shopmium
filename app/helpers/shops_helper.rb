module ShopsHelper
  include Math

  def finder(params)
  	array = []
    if !params["place"].blank?
      place = params["place"].delete("*+/\\_()[]{}\"#~@°%$;:!?") 
      Shop.where("city ~* ?", "#{place}").each do |s| array << s end
      Shop.where("address ~* ?", "#{place}").each do |s| array << s end
      Shop.where("zip ~* ?", "#{place}").each do |s| array << s end
	elsif !params["t"].blank?
	  case params["t"]
	    when '0'
	      array = Shop.all.order(:created_at)
		when '1'
		  array = Shop.all.order(created_at: :desc)
		when '2'
		  array = Shop.all.order(updated_at: :desc)
		end
	else
	 array = Shop.all
	end
	return array
  end

  def find_with_filter(params)
  	if params["position"].blank?
  		return nil
  	elsif Geocoder.search(params["position"]).blank?
  		return nil
  	elsif params["km"].blank?
  		params["km"] = 20
  	end
  	position = Geocoder.search(params["position"]).first.coordinates
  	lat1 = position[0]
  	lon1 = position[1]
  	array = []
  	Shop.all.each do |shop|
  	  lat2 = shop.latitude.to_f
  	  lon2 = shop.longitude.to_f

  	  if distance(lat1, lon1, lat2, lon2) <= params["km"].to_i + 2
  	  	array << shop
  	  end  
  	end
  	return array
  end

  def distance(lat1, lon1, lat2, lon2)
    r = 6366
  	lat1 = lat1 * PI / 180 #deg2rad
  	lon1 = lon1 * PI / 180 #deg2rad
  	lat2 = lat2 * PI / 180 #deg2rad
  	lon2 = lon2 * PI / 180 #deg2rad

  	def pow(x,y)
  		x ** y
  	end

  	f = 2 * asin(sqrt(pow( sin((lat1-lat2)/2) , 2) + cos(lat1)*cos(lat2)* pow( sin((lon1-lon2)/2) , 2)))
  	km = f * r
  	return km
  end
  # R * pi * sqrt((x1-x2)²+(y1-y2²)/180)
end