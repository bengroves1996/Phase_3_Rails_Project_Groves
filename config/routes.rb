Rails.application.routes.draw do
  root to: 'sessions#welcome'
  get '/auth/:provider/callback', to: "sessions#omniauth" # coming back from google
  get '/projects/high_priority', to: 'projects#high_priority', as: 'high_priority_projects'
  get 'sessions/home'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/welcome', to: 'sessions#welcome'
  get '/users/tasker'

  # get '/projects/index', to: 'projects#index', as: 'projects'
  


  delete 'logout'  => 'sessions#destroy'
  resources :users, only: [:new, :create, :tasker, :edit, :update]
  resources :sessions, only: [:new, :create, :home]
  resources :projects
  resources :projects do
    resources :tasks, only: [:new, :create, :index] # nested task resources into projects' resources
  end

  
end


# resources :projects
#/projects/index
#/projects/show
#get '/projects' to: "projects#index"
#get '/projects/:id' to: "projects#show"
