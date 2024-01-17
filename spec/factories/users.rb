# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Forgery::Internet.email_address }
    last_name { Faker::Name.last_name }
    password { Faker::Internet.password }
    contact_number { Faker::PhoneNumber.phone_number }
    blood_group { Faker::Blood.blood_type }
    company_name { Faker::Company.name }
  end
end
