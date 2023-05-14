class AddParameterToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :balance_after, :integer
  end
end
