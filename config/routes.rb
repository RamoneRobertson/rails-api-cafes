Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # Cafes
      resources :cafes, only: [ :index, :create ]
    end
  end
end
