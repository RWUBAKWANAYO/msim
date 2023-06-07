Rails.application.routes.draw do
  post '/register', to: 'registrations#create'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

    namespace :api do
    namespace :v1 do
      resources :courses
      resources :enrollments
    end
  end
end
