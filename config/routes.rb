Rails.application.routes.draw do
  resources :human_resources, :projects, :companies do
    collection do
      get :export_csv
    end
  end
  root "welcome#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
