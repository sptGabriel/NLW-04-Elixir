defmodule Spiritpay do
  alias Spiritpay.Users.Create, as: UserCreate
  defdelegate create_user(params), to: UserCreate, as: :call
end
