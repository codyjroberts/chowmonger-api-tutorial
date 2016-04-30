defmodule Chowmonger.API.V1.UserTest do
  use Chowmonger.ModelCase

  alias Chowmonger.API.V1.User

  @valid_attrs %{email: "email@email.com", name: "some content", password: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
