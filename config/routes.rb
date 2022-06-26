Rails.application.routes.draw do
  root 'flights#index'
  get 'about', to: 'application#about'

  resources :flights
  resources :bookings, except: [:destroy]
  resources :passengers, except: [:destroy, :index]
end
