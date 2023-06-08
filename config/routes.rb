Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"
  get '/my_events', to: 'events#my_events', as: :my_events
  get "my_bookings", to: "bookings#my_bookings", as: :my_bookings
  resources :events do
    resources :bookings, only: %i[index show]
  end
end
