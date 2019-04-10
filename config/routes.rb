Rails.application.routes.draw do
  resources :tickets
  resources :event_venues
  resources :events do
    collection do
      get :upcoming_events
    end
  end
  resources :users do
    collection do
      get :users_with_most_tickets
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
