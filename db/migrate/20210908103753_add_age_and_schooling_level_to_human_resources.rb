class AddAgeAndSchoolingLevelToHumanResources < ActiveRecord::Migration[6.1]
  def change
    add_column :human_resources, :age, :integer
    add_column :human_resources, :schooling_level, :string
  end
end
