FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Forgery::Internet.email_address }
    name: "Name",
    last_name: "Last Name",
    password: "password123",   
    contact_number: "Contact Number",
    blood_group: "Blood Group",
    company_name: "Company Name"
  end
end