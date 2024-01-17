# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/index', type: :view do
  let(:user1) do
    User.create!(name: 'MyString', last_name: 'MyString', email: 'valid@example.com', password: 'password123',
                 contact_number: 'MyString', blood_group: 'MyString', company_name: 'MyString')
  end

  let(:user2) do
    User.create!(name: 'MyString', last_name: 'MyString', email: 'valifd@example.com', password: 'password123',
                 contact_number: 'MyString', blood_group: 'MyString', company_name: 'MyString')
  end

  before(:each) do
    assign(:users, [user1, user2])
  end

  it 'renders a list of users' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 0
    assert_select cell_selector, text: Regexp.new('Last Name'.to_s), count: 0
    assert_select cell_selector, text: Regexp.new('Email'.to_s), count: 0
    assert_select cell_selector, text: Regexp.new('Contact Number'.to_s), count: 0
    assert_select cell_selector, text: Regexp.new('Blood Group'.to_s), count: 0
    assert_select cell_selector, text: Regexp.new('Company Name'.to_s), count: 0
  end
end
