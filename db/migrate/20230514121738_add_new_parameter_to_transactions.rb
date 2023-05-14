class AddNewParameterToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :status_of_payment, :string
    add_column :transactions, :timestamp, :datetime
    add_column :transactions, :destination, :string
  end
end
