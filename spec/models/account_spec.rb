require 'rails_helper'

RSpec.describe Account, type: :model do
  let(:account) { Account.create!(full_name: "User1", address: "XAZ", phone: "9087654311", national_id: "ID12345", balance: 1000) }
  it "generates a 16-digit account number" do
    expect(account.account_number.length).to eq(16)
  end

  context "valid credit transaction" do
    it " increases the account balance" do
      expect {
           Transaction.create!(account: account, transaction_type: "credit", amount: 400)
      }.to change { account.reload.balance }.from(1000).to(1400)
    end
  end

  context "valid debit transaction" do
    it " Decreases the account balance " do
      expect {
           Transaction.create!(account: account, transaction_type: "debit", amount: 400)
    }.to change { account.reload.balance }.from(1000).to(600)
    end
  end
end
