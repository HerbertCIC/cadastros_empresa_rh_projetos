class RenameDescriptionToName < ActiveRecord::Migration[6.1]
  def change
    rename_column :companies, :description, :name
    rename_column :human_resources, :description, :name
    rename_column :projects, :description, :name
  end
end
