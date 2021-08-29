json.extract! company, :id, :description, :cnpj, :email, :created_at, :updated_at
json.url company_url(company, format: :json)
