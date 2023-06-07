Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"
  get '/my_events', to: 'events#my_events'
  resources :events do
    resources :bookings, only: %i[index show]
  end
end
