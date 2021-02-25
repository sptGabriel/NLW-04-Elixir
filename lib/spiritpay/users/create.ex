defmodule Spiritpay.Users.Create do
  alias Spiritpay.{Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
