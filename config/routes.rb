Rails.application.routes.draw do

  devise_for :artists, controllers: { registrations: "artists/registrations",
    omniauth_callbacks: 'artists/omniauth_callbacks' }
    devise_for :users

    mount ActionCable.server => '/cable'

    root to: 'pages#home'

    get '/about', to: 'pages#about'
    get '/dashboard', to: 'pages#dashboard'

    get '/edit_profile', to: 'pages#edit_profile'

    get '/dashboard/refresh', to: 'pages#refresh'
    post '/dashboard', to: 'pages#create_message', as: "post_message"

    resources :messages, only: [:new, :create, :show]

    resources :availabilities, only: [:new, :create, :destroy]

    resources :artists, only: [:index, :show, :edit, :update] do




      member do
        post "upload_pictures", to: "artists#upload"
      end

      resources :reviews, only: [:new, :create]
      resources :appointments, only: [:new, :create, :destroy, :show] do
        resources :chatrooms, only: [:show]
      end



    end
  end
