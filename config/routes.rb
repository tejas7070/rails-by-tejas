Rails.application.routes.draw do
  devise_for :users

  resources :accounts do
    member do
      patch :status_change
      get :history       # shows this account’s transactions
      get :transact      # shows new transaction form
    end
  end

  resources :transactions, only: [ :new, :index, :create, :show ] do
    collection do
      get :history_all   # shows all transactions across all accounts
    end
  end

  root "accounts#index"
end
