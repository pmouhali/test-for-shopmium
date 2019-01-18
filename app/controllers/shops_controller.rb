class ShopsController < ApplicationController
  def index
    @shops = Shop.all
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
    @shop.save
    #flash[:success] = "Shop succesfully added !"
    redirect_to root_path
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
