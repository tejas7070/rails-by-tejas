FactoryBot.define do
  factory :account do
    full_name { "MyString" }
    address { "MyText" }
    phone { "MyString" }
    national_id { "MyString" }
    account_number { "MyString" }
    balance { "9.99" }
    status { 1 }
  end
end
