require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  let(:user) {
    User.create!(
      name: "MyString",
      last_name: "MyString",
      email: "MyString",
      contact_number: "MyString",
      blood_group: "MyString",
      company_name: "MyString"
    )
  }

  before(:each) do
    assign(:user, user)
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(user), "post" do

      assert_select "input[name=?]", "user[name]"

      assert_select "input[name=?]", "user[last_name]"

      assert_select "input[name=?]", "user[email]"

      assert_select "input[name=?]", "user[contact_number]"

      assert_select "input[name=?]", "user[blood_group]"

      assert_select "input[name=?]", "user[company_name]"
    end
  end
end
