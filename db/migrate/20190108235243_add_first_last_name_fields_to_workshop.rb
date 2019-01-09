class AddFirstLastNameFieldsToWorkshop < ActiveRecord::Migration[5.2]
  def change
    add_column :workshops, :first_name, :string
    add_column :workshops, :last_name, :string
  end
end
