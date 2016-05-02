defmodule Chowmonger.API.V1.TruckControllerTest do
  use Chowmonger.ConnCase

  alias Chowmonger.API.V1.Truck
  @valid_attrs %{categories: [], image: "some content", lat: "120.5", lng: "120.5", menu: [], name: "some content", status: true}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "content-type", "application/vnd.api+json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, truck_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end
end
