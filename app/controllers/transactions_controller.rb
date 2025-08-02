class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[ show ]

  def index
    @account = Account.find(params[:id])
    @transactions = @account.transactions.order(created_at: :desc)
  end

  def show
  end

  def new
    @transaction = Transaction.new
  end


  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      redirect_to @transaction, notice: "Transaction was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end
  def history_all
    @transactions = Transaction.order(created_at: :desc)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.expect(transaction: [ :transaction_type, :amount, :account_id ])
    end
end
