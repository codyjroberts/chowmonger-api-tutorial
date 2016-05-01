defmodule Chowmonger.API.V1.TruckTest do
  use Chowmonger.ModelCase

  alias Chowmonger.API.V1.Truck

  @valid_attrs %{categories: [], image: "some content", lat: "120.5", lng: "120.5", menu: [], name: "some content", status: true}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Truck.changeset(%Truck{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Truck.changeset(%Truck{}, @invalid_attrs)
    refute changeset.valid?
  end
end
