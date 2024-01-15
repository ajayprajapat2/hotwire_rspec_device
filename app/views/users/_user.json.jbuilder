json.extract! user, :id, :name, :last_name, :email, :contact_number, :blood_group, :company_name, :created_at, :updated_at
json.url user_url(user, format: :json)
