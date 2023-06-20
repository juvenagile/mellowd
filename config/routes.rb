Rails.application.routes.draw do
  get 'newsletter_messages/edit'
  get 'newsletter_messages/update'
  get 'subscriptions/create'
  devise_for :users
  root to: "discovers#index"
  get '/my_events', to: 'events#my_events', as: :my_events
  get "my_bookings", to: "bookings#my_bookings", as: :my_bookings
  resources :discovers, except: [:update]
  resources :events do
    resources :bookings, only: %i[index show create]
  end

  resources :dashboards
  resources :chatrooms, only: %i[show index create destroy] do
    resources :messages, only: :create
  end
  # get '/users/:id/dashboard', to: 'users#dashboard', as: :dashboard
  post 'subscribe', to: 'subscriptions#create'
  get 'edit_newsletter_message', to: 'newsletter_messages#edit'
  patch 'update_newsletter_message', to: 'newsletter_messages#update'
end
