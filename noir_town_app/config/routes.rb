Rails.application.routes.draw do
  resources :tunes
  root :to => redirect('/tunes')
    
  # Route for Artists Page.
  get '/artist/:id', to: 'tunes#find_artist', as: 'artist'
end