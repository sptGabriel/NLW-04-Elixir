defmodule SpiritpayWeb.UsersController do
  use SpiritpayWeb, :controller

  alias Spiritpay.User

  action_fallback SpiritpayWeb.FallbackController
  def create(conn, params) do
    with {:ok, %User{} = user} <- Spiritpay.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
