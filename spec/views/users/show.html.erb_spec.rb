require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    assign(:user, User.create!(
      name: "Name",
      last_name: "Last Name",
      email: "Email",
      contact_number: "Contact Number",
      blood_group: "Blood Group",
      company_name: "Company Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Contact Number/)
    expect(rendered).to match(/Blood Group/)
    expect(rendered).to match(/Company Name/)
  end
end