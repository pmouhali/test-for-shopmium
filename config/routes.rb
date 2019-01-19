Rails.application.routes.draw do

	root 'shops#index'

	get '/shops/find', to: 'shops#find'

	resources :shops

end
