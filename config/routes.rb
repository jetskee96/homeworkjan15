Rails.application.routes.draw do


  devise_for :users
#  resources :users
  resources :movies do 
  resources :movie_genres  do 
    member { post :vote }
  resources :movie_genre_comments, shallow: true do
    member { post :vote }
      end
    end
  resources :movie_themes do 
    member { post :vote }
  resources :movie_theme_comments, shallow: true do
    member { post :vote }
  end
end
    
      resources :movie_locations do 
    member { post :vote }
  resources :movie_location_comments, shallow: true do
    member { post :vote }
            
    end
  end


resources :movie_characters do 
    member { post :vote }
  resources :movie_character_comments, shallow: true do
    member { post :vote }
  end
end
    
resources :movie_brands do 
    member { post :vote }
  resources :movie_brand_comments, shallow: true do
    member { post :vote }
            
    end
  end

resources :movie_goofs do 
    member { post :vote }
  resources :movie_goof_comments, shallow: true do
    member { post :vote }
  end
end
    
resources :movie_references do 
    member { post :vote }
  resources :movie_reference_comments, shallow: true do
    member { post :vote }
  end
end

resources :movie_songs do 
    member { post :vote }
  resources :movie_song_comments, shallow: true do
    member { post :vote }
  end
end
resources :movie_technicals do 
    member { post :vote }
  resources :movie_technical_comments, shallow: true do
    member { post :vote }
  end
end

resources :movie_quotes do 
    member { post :vote }
  resources :movie_quote_comments, shallow: true do
    member { post :vote }
  end
end
      
      
end

   
  get 'search', to: 'search#search'

  
   root 'movies#index'


end
