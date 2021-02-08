Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/mdprofile', to: 'doctors#profile'
      get '/ptprofile', to: 'patients#profile'
      post '/login', to: 'auth#create'
      post '/patientlogin', to: 'auth#createuser'
      
    end
  end
end 
