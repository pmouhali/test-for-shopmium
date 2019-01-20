module ShopsHelper
  def finder(params)
    if !params["place"].blank?
      array = []
      place = params["place"].delete("*+/\\_()[]{}\"#~@°%$;:!?") 
      Shop.where("city ~* ?", "#{place}").each do |s| array << s end
      Shop.where("address ~* ?", "#{place}").each do |s| array << s end
      Shop.where("zip ~* ?", "#{place}").each do |s| array << s end
	end
	return array
  end
end
