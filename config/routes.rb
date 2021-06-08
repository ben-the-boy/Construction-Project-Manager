Rails.application.routes.draw do
  root 'welcome#index'
  resources :subcontractors
  resources :materials
  resources :users do
    resources :projects
  end
  resources :sessions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
