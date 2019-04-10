Rails.application.routes.draw do
  resources :tickets
  resources :event_venues
  resources :events
  resources :users
  resources :ticket_types do
    resources :tickets
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
