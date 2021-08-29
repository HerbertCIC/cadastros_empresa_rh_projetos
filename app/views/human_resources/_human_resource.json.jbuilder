json.extract! human_resource, :id, :description, :cpf, :email, :phone_number, :company_id, :created_at, :updated_at
json.url human_resource_url(human_resource, format: :json)
