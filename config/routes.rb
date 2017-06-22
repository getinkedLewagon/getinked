Rails.application.routes.draw do
  devise_for :artists, controllers: { registrations: "artists/registrations",
    omniauth_callbacks: 'artists/omniauth_callbacks' }
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/about', to: 'pages#about'
  get '/dashboard', to: 'pages#dashboard'
  resources :artists, only: [:index, :show] do
    member do
      post "upload_pictures", to: "artists#upload"
    end
    resources :reviews, only: [:new, :create]
    resources :appointments, only: [:new, :create, :destroy, :show]
  end

end
