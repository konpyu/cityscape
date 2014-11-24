Rails.application.routes.draw do
  root 'photos#index'

  resources :photos, only: [:index, :destroy]
end
