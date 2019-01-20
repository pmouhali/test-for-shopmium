module ShopsHelper
  def finder(params)
  	array = []
    if !params["place"].blank?
      place = params["place"].delete("*+/\\_()[]{}\"#~@°%$;:!?") 
      Shop.where("city ~* ?", "#{place}").each do |s| array << s end
      Shop.where("address ~* ?", "#{place}").each do |s| array << s end
      Shop.where("zip ~* ?", "#{place}").each do |s| array << s end
	else
	 array = Shop.all
	end
	return array
  end

  def find_with_filter(params)
  	
  end

  def distance(lat1, lon1, lat2, lon2)
    r = 6366
  	lat1 = lat1 * Math::PI / 180 #deg2rad
  	lon1 = lon1 * Math::PI / 180 #deg2rad
  	lat2 = lat2 * Math::PI / 180 #deg2rad
  	lon2 = lon2 * Math::PI / 180 #deg2rad

  	def pow(x,y)
  		x ** y
  	end

  	f = 2 * asin(sqrt(pow( sin((lat1-lat2)/2) , 2) + cos(lat1)*cos(lat2)* pow( sin((lon1-lon2)/2) , 2)))
  	km = f * r
  	return km
  end
end
