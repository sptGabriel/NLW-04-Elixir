defmodule SpiritpayWeb.AccountsController do
  use SpiritpayWeb, :controller

  alias Spiritpay.{Account}
  alias Spiritpay.Accounts.Transactions.Response, as: TransactionResponse

  action_fallback SpiritpayWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- Spiritpay.deposit(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def withdraw(conn, params) do
    with {:ok, %Account{} = account} <- Spiritpay.withdraw(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def transaction(conn, params) do
    with {:ok, %TransactionResponse{} = transaction} <- Spiritpay.transaction(params) do
      conn
      |> put_status(:ok)
      |> render("transaction.json", transaction: transaction)
    end
  end
end
