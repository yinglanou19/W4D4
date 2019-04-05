Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :users 
  resources :bands
  resource :session

  resources :bands do
    # a route for all albums of a given band
    resources :albums, only: :index
  end

  resources :albums
 

end
