defmodule SpiritpayWeb.UsersView do

  alias Spiritpay.User

  def render("create.json", %{user: %User{id: id, name: name, username: username}}) do
    %{
      message: "User Created",
      user: %{
        id: id,
        name: name,
        username: username,
      }
    }
  end
end
