Rails.application.routes.draw do
  root "welcome#index"

  devise_for :users, only: %i[sessions registrations passwords]

  resources :human_resources, :projects, :companies do
    collection do
      get :export_csv
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
