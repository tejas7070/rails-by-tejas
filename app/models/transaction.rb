class Transaction < ApplicationRecord
  belongs_to :account


  validates :amount, numericality: { greater_than: 0 }

  after_create :update_account_balance

  private




  def update_account_balance
    if transaction_type == "debit"
      raise "Insufficient balance" if account.balance < amount

      account.update!(balance: account.balance - amount)
    elsif transaction_type == "credit"
        account.update!(balance: account.balance + amount)
    end
  end
end
