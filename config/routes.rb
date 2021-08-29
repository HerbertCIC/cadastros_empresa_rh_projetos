Rails.application.routes.draw do
  resources :human_resources
  resources :projects
  resources :companies
  root "welcome#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
