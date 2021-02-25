defmodule Spiritpay do
  alias Spiritpay.Users.Create, as: UserCreate

  alias Spiritpay.Accounts.Deposit

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate deposit(params), to: Deposit, as: :call
end
