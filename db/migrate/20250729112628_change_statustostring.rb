class ChangeStatustostring < ActiveRecord::Migration[8.0]
  def change
    change_column :accounts, :status, :string, default: 'active'
  end
end
