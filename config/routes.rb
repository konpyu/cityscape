Rails.application.routes.draw do
  root 'photos#index'

  get "about" => 'pages#about'
  resources :photos, only: [:index, :destroy] do
    collection do
      get 'standby'
    end
    member do
      put 'activate'
    end
  end

end
