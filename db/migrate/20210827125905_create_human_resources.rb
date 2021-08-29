class CreateHumanResources < ActiveRecord::Migration[6.1]
  def change
    create_table :human_resources do |t|
      t.string :description
      t.string :cpf
      t.string :email
      t.string :phone_number
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
