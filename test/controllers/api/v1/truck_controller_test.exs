defmodule Chowmonger.API.V1.TruckControllerTest do
  use Chowmonger.ConnCase

  alias Chowmonger.API.V1.Truck
  @valid_attrs %{categories: [], image: "some content", lat: "120.5", lng: "120.5", menu: [], name: "some content", status: true}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, truck_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    truck = Repo.insert! %Truck{}
    conn = get conn, truck_path(conn, :show, truck)
    assert json_response(conn, 200)["data"] == %{"id" => truck.id,
      "name" => truck.name,
      "lat" => truck.lat,
      "lng" => truck.lng,
      "image" => truck.image,
      "user_id" => truck.user_id,
      "menu" => truck.menu,
      "status" => truck.status,
      "categories" => truck.categories}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, truck_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, truck_path(conn, :create), truck: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Truck, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, truck_path(conn, :create), truck: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    truck = Repo.insert! %Truck{}
    conn = put conn, truck_path(conn, :update, truck), truck: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Truck, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    truck = Repo.insert! %Truck{}
    conn = put conn, truck_path(conn, :update, truck), truck: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    truck = Repo.insert! %Truck{}
    conn = delete conn, truck_path(conn, :delete, truck)
    assert response(conn, 204)
    refute Repo.get(Truck, truck.id)
  end
end
