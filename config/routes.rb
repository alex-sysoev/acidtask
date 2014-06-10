Acidnametest::Application.routes.draw do

  #Home route
  root to: 'clickers#index'

  #Clickers
  resources :clickers

end
