class Account < ApplicationRecord
    has_many :transactions, dependent: :destroy
    has_one_attached :national_id_image


    before_create :generate_account_number

    private
    def generate_account_number
        loop do
            self.account_number = SecureRandom.random_number(10**16).to_s.rjust(10, "0")
            break unless Account.exists?(account_number: account_number)
        end
        self.balance ||= 0
    end
end
