class ChangetransactionTypetostring < ActiveRecord::Migration[8.0]
  def change
    change_column :transactions, :transaction_type, :string
  end
end
