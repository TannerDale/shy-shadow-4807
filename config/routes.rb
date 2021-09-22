Rails.application.routes.draw do
  resources :plots, only: :index

  resources :locations, only: :destroy
end
