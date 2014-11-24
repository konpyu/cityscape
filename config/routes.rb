Rails.application.routes.draw do
  root 'photos#index'

  get "about" => 'pages#about'
  resources :photos, only: [:index, :destroy]
end
