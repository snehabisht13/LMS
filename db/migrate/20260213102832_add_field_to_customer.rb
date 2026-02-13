class AddFieldToCustomer < ActiveRecord::Migration[8.0]
  def change
    add_column :customers, :username, :string
    add_column :customers, :address, :string
    add_column :customers, :phone_number, :string
    add_column :customers, :account_number, :string
    
  end
end
