defmodule Spiritpay.Repo do
  use Ecto.Repo,
    otp_app: :spiritpay,
    adapter: Ecto.Adapters.Postgres
end
