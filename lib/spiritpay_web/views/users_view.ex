defmodule SpiritpayWeb.UsersView do
  alias Spiritpay.{Account, User}

  def render("create.json", %{
        user: %User{
          account: %Account{id: account_id, balance: balance},
          id: id,
          name: name,
          username: username
        }
      }) do
    %{
      message: "User Created",
      user: %{
        id: id,
        name: name,
        username: username,
        account: %{
          id: account_id,
          balance: balance
        }
      }
    }
  end
end
