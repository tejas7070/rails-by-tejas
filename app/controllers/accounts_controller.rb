class AccountsController < ApplicationController
  before_action :set_account, only: %i[ show edit update destroy ]


  def index
    @accounts = Account.all
  end

  def show
  end


  def new
    @account = Account.new
  end

  def edit
    # edit
  end

  def create
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: "Account was successfully created." }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: "Account was successfully updated." }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @account.destroy!

    respond_to do |format|
      format.html { redirect_to accounts_path, status: :see_other, notice: "Account was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  # function for changing the status of the account
  def status_change
    @account = Account.find(params[:id])
    if @account.active?
      @account.suspended!
      flash[:notice] = "Account suspended!!"
    else
      @account.active!
      flash[:notice] = "Account Activated!!"
    end
  end

  # function for getting the Transaction History
  def history
    @account = Account.find(params[:id])
    @transactions = @account.transactions.order(created_at: :desc)
    render "transactions/index"
  end

  # function for making transaction using the account
  def transact
    @account = Account.find(params[:id])
    if @account.status == "suspended"
      redirect_back fallback_location: accounts_path(@account), notice: "ACCOUNT IS SUSPENDED CANNOT PERFORM TRANSACTIONS !!!!!"
    end
    @transaction = Transaction.new(account_id: @account.id)
  end

  def perform_transaction
    @account = Account.find(params[:id])
    @transaction = @account.transactions.build(transaction_params)

    if @transaction.save
      redirect_to account_path(@account), notice: "Transaction successful."
    else
      redirect_to transact_account_path(@account), alert: @transaction.errors.full_messages.to_sentence
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def account_params
      params.expect(account: [ :full_name, :address, :phone, :national_id, :account_number, :balance, :status ])
    end
end
