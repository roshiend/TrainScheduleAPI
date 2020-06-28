Rails.application.routes.draw do
	root 'dashboard#index'
  resources :stations
 
end
