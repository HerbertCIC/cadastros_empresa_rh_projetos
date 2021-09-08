class AddContactToCompanies < ActiveRecord::Migration[6.1]
  def change
    add_column :companies, :contact_name, :string
    add_column :companies, :contact_email, :string
  end
end
