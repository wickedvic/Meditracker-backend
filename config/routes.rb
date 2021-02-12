Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/mdprofile', to: 'doctors#profile'
      get '/ptprofile', to: 'users#profile'
      post '/login', to: 'auth#create'
      post '/patientlogin', to: 'auth#createuser'
      resources :doctors, only: [:show]
      resources :users, only: [:show]
      resources :user_meds, only: [:create, :update, :destroy]
      resources :meds, only: [:index]
    end
  end
end 
