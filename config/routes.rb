Rails.application.routes.draw do

  devise_for :users
   resources :movies do 
    resources :genre_linkers
   end
   
   root 'movies#index'


end
