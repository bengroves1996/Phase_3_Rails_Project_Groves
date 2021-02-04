Rails.application.routes.draw do
  root to: 'sessions#welcome'

  get '/projects/high_priority', to: 'projects#high_priority', as: 'high_priority_projects'

  get 'sessions/home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/welcome', to: 'sessions#welcome'
  get '/users/tasker'

  
  delete 'logout'  => 'sessions#destroy'
  resources :users, only: [:new, :create, :tasker, :edit, :update]
  resources :sessions, only: [:new, :create, :home]
  resources :tasks 
  resources :projects
  # nest task resources into projects' resources
  get '/auth/:provider/callback', to: "sessions#omniauth" ###coming back from google
end
