Rails.application.routes.draw do
  post 'tickets/create', to 'tickets#create'
  delete 'tickets/destroy', to 'tickets#destroy'
  patch 'tickets/update', to 'tickets#update'
  post 'event_venues/create', to 'event_venues#create'
  delete 'event_venues/destroy', to 'event_venues#destroy'
  patch 'event_venues/update', to 'event_venues#update'
  post 'events/create', to 'events#create'
  delete 'events/destroy', to 'events#destroy'
  patch 'events/update', to 'events#update'
  post'users/create', to 'users#create'
  delete 'users/destroy', to 'users#destroy'
  patch 'users/update', to 'users#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
