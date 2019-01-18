Rails.application.routes.draw do

  get 'shops/index'
  get 'shops/new'
  get 'shops/create'
  get 'shops/edit'
  get 'shops/update'
  get 'shops/destroy'
	root 'shops#index'

	resources :shops

end
