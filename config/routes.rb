Rails.application.routes.draw do

  devise_for :users
  resources :movies do 
    resources :genre_linkers  do 
      member { post :vote }
    end
  end
   
   root 'movies#index'


end
