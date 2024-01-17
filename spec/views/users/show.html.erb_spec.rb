# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/show', type: :view do
  before(:each) do
    assign(:user, User.create!(
                    name: 'Name',
                    last_name: 'Last Name',
                    email: 'valid@example.com',  # Provide a valid email
                    password: 'password123',     # Provide a non-blank password
                    contact_number: 'Contact Number',
                    blood_group: 'Blood Group',
                    company_name: 'Company Name'
                  ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/valid@example.com/)
    expect(rendered).to match(/Contact Number/)
    expect(rendered).to match(/Blood Group/)
    expect(rendered).to match(/Company Name/)
  end
end
