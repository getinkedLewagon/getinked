Rails.application.routes.draw do

  devise_for :artists, controllers: { registrations: "artists/registrations",
    omniauth_callbacks: 'artists/omniauth_callbacks' }
    devise_for :users

    root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/about', to: 'pages#about'
  get '/dashboard', to: 'pages#dashboard'

  get '/edit_profile', to: 'pages#edit_profile'
  resources :artists, only: [:index, :show, :edit, :update] do

   get '/dashboard/refresh', to: 'pages#refresh'
   post '/dashboard', to: 'pages#create_message', as: "post_message"


   member do
    post "upload_pictures", to: "artists#upload"
  end
  resources :reviews, only: [:new, :create]
  resources :appointments, only: [:new, :create, :destroy, :show] do
    member do
      get 'confirm'
      get 'deny'
    end
      resources :messages, only: [:new, :create, :show]
    end
  end
  resources :availabilities, only: [:new, :create, :destroy]

end
