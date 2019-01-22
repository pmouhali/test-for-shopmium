class ShopsController < ApplicationController
  def find
    if !request.location.latitude.blank?
      @shops = helpers.find_with_user_position(request.location.latitude, request.location.longitude)
    else  
      @shops = helpers.find_with_filter(params)
    end
  end

  def index  
    @shops = helpers.finder(params)    
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new
    @shop.chain = "shopmium"
    @shop.name = params["shop"]["name"]
    @shop.address = params["shop"]["address"]
    @shop.city = params["shop"]["city"]
    @shop.phone = params["shop"]["phone"]
    @shop.zip = params["shop"]["zip"]
    @shop.country_code = params["shop"]["country_code"]
    @shop.latitude = params["shop"]["latitude"]
    @shop.longitude = params["shop"]["longitude"]
    if @shop.save
      flash[:success] = "Shop succesfully added !"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @shop = Shop.find(params["id"])
  end

  def update
    @shop = Shop.find(params["id"])
    if @shop.update(name: params["shop"]["name"], address: params["shop"]["address"],
      city: params["shop"]["city"], phone: params["shop"]["phone"], zip: params["shop"]["zip"],
      country_code: params["shop"]["country_code"], latitude: params["shop"]["latitude"],
      longitude: params["shop"]["longitude"])
      flash[:success] = "Shop succesfully edited !"
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if Shop.find(params["id"]).delete then flash[:success] = "Shop succesfully deleted !" and redirect_to root_path end
  end
end
