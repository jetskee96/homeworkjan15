Rails.application.routes.draw do
  devise_for :users
 
  resources :movies do 
    resources :movie_genres  do 
      member { post :vote }
      resources :movie_genre_comments, shallow: true do
        member { post :vote }
    end
    end
  end
   
  get 'search', to: 'search#search'

  
   root 'movies#index'


end
