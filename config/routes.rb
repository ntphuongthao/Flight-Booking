Rails.application.routes.draw do
  root 'flights#index'
  get 'about', to: 'application#about'
  resources :flights
end
