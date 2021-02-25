defmodule SpiritpayWeb.AccountsController do
  use SpiritpayWeb, :controller

  alias Spiritpay.{Account, User}

  action_fallback SpiritpayWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- Spiritpay.deposit(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end
end
