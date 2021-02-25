defmodule SpiritpayWeb.FallbackController do
  use SpiritpayWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(SpiritpayWeb.ErrorView)
    |> render("400.json", result)
  end
end
