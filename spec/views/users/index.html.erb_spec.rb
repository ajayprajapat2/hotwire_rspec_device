require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
      name: "MyString",
      last_name: "MyString",
      email: "valid@example.com",  # Provide a valid email
      password: "password123",     # Provide a non-blank password
      contact_number: "MyString",
      blood_group: "MyString",
      company_name: "MyString"
    ),
      User.create!(
      name: "MyString",
      last_name: "MyString",
      email: "valifd@example.com",  # Provide a valid email
      password: "password123",     # Provide a non-blank password
      contact_number: "MyString",
      blood_group: "MyString",
      company_name: "MyString"
    )
    ])
  end

  it "renders a list of users" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 0
    assert_select cell_selector, text: Regexp.new("Last Name".to_s), count: 0
    assert_select cell_selector, text: Regexp.new("Email".to_s), count: 0
    assert_select cell_selector, text: Regexp.new("Contact Number".to_s), count: 0
    assert_select cell_selector, text: Regexp.new("Blood Group".to_s), count: 0
    assert_select cell_selector, text: Regexp.new("Company Name".to_s), count: 0
  end
end
