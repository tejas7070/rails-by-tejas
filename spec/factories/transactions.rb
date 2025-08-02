FactoryBot.define do
  factory :transaction do
    transaction_type { 1 }
    amount { "9.99" }
    account { nil }
  end
end
