Rails.application.routes.draw do

	root 'shops#find'

	get '/shops/find', to: 'shops#find'

	resources :shops

end