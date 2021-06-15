Rails.application.routes.draw do
  root 'welcome#index'
  resources :clients
  resources :subcontractors
  resources :materials
  resources :users do
    resources :projects
    get '/longest_project', to: 'projects#longest_project'
  end
  resources :projects
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/auth/facebook/callback', to: 'sessions#create_from_facebook'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
