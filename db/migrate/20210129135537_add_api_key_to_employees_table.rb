class AddApiKeyToEmployeesTable < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :api_key, :string
  end
end
