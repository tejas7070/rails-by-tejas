class CreateAccounts < ActiveRecord::Migration[8.0]
  def change
    create_table :accounts do |t|
      t.string :full_name
      t.text :address
      t.string :phone
      t.string :national_id
      t.string :account_number
      t.decimal :balance
      t.integer :status

      t.timestamps
    end
  end
end
