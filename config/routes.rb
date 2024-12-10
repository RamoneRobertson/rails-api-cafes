Rails.application.routes.draw do
  # Cafes
  resources :cafes, only: [ :index, :create ]
end
