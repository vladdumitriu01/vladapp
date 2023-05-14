class AddCustomParametersToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :bambeuro, :float
  end
end
