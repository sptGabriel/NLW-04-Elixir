defmodule Spiritpay.Users.CreateTest do
  use Spiritpay.DataCase

  alias Spiritpay.User
  alias Spiritpay.Users.Create

  describe "call/1" do
    test "when all params are valid, returns an user" do
      params = %{
        name: "testcreate",
        password: "123456",
        username: "testuser",
        email: "test@test.com",
        age: 22
      }

      {:ok, %User{id: user_id}} = Create.call(params)

      user = Repo.get(User, user_id)

      assert %User{name: "testcreate", age: 22, id: ^user_id} = user
    end

    test "when there are invalid params, returns an user" do
      params = %{
        name: "testcreate",
        username: "testuser",
        email: "test@test.com",
        age: 2
      }

      {:error, changeset} = Create.call(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["can't be blank"]
      }

      assert errors_on(changeset) === expected_response
    end
  end
end
