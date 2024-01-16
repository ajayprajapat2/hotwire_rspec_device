require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(:user),
      User.create!(:user)
    ])
  end

  it "renders a list of users" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 6
    assert_select cell_selector, text: Regexp.new("Last Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Email".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Contact Number".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Blood Group".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Company Name".to_s), count: 2
  end
end
