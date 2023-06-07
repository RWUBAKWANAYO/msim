Rails.application.routes.draw do
  post '/register', to: 'registrations#create'
  post '/login', to: 'sessions#create'
end
