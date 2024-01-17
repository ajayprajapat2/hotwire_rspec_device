# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.string :email, null: false, default: '', unique: true
      t.string :contact_number
      t.string :blood_group
      t.string :company_name

      t.timestamps
    end
  end
end
