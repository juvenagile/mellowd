Rails.application.routes.draw do
  resources :events
  devise_for :users
  root to: "events#index"
  resources :events do
    resources :bookings, only: %i[index]
  end
end
