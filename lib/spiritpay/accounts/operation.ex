defmodule Spiritpay.Accounts.Operation do
  alias Ecto.{Multi}

  alias Spiritpay.{Account}

  def call(%{"id" => id, "value" => value}, operation) do
    operation_name = account_operation_name(operation)
    Multi.new()
    |> Multi.run(operation_name, fn repo, _changes -> get_account(repo, id) end)
    |> Multi.run(operation, fn repo, changes ->
      account = Map.get(changes, operation_name)
      update_balance(repo, account, value, operation)
    end)
  end

  defp get_account(repo, id) do
    case repo.get(Account, id) do
      nil -> {:error, "Account not found!"}
      account -> {:ok, account}
    end
  end

  defp update_balance(repo, account, value, operation) do
    account
    |> operation(value, operation)
    |> update_account(repo, account)
  end

  defp operation(%Account{balance: balance}, value, operation) do
    value
    |> Decimal.cast()
    |> handle_cast(balance, operation)
  end

  defguard is_decimal_positive(value)
    when is_map(value) and
         value.__struct__ == Decimal and
         value.sign == 1

  defp handle_cast({:ok, value}, balance, :deposit)
  when is_decimal_positive(value),
  do: Decimal.add(balance, value)

  defp handle_cast({:ok, value}, balance, :withdraw)
  when is_decimal_positive(value),
  do: Decimal.sub(balance, value)

  defp handle_cast(_error, _balance, _),
  do: {:error, "Number must be positive decimal"}

  defp update_account({:error, _reason} = error, _repo, _account), do: error

  defp update_account(value, repo, account) do
    params = %{balance: value}

    account
    |> Account.changeset(params)
    |> repo.update()
  end

  defp account_operation_name(operation) do
    "account_#{Atom.to_string(operation)}" |> String.to_atom()
  end
end
