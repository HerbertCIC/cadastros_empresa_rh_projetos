Rails.application.routes.draw do
  root "welcome#index"

  devise_for :users, only: %i[sessions registrations passwords]

  resources :human_resources, :projects, :companies, :users do
    collection do
      get :export_csv
    end
    member do
      # /agreements/:id/export
      get "export"
    end
  end

  get "/company_export" => "company#export"
end
