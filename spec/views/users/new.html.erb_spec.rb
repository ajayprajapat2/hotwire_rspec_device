require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      name: "MyString",
      last_name: "MyString",
      email: "valid@example.com",  # Provide a valid email
      password: "password123",     # Provide a non-blank password
      contact_number: "MyString",
      blood_group: "MyString",
      company_name: "MyString"
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input[name=?]", "user[name]"

      assert_select "input[name=?]", "user[last_name]"

      assert_select "input[name=?]", "user[email]"

      assert_select "input[name=?]", "user[contact_number]"

      assert_select "input[name=?]", "user[blood_group]"

      assert_select "input[name=?]", "user[company_name]"
    end
  end
end
