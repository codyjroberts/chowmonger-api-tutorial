defmodule Chowmonger.API.V1.UserControllerTest do
  use Chowmonger.ConnCase

  alias Chowmonger.API.V1.User

  @valid_attrs %{"user" =>
                  %{
                    email: "some content",
                    name: "some content",
                    password_hash: "some content"
                  }
                }

  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/vnd.api+json")}
    {:ok, conn: put_req_header(conn, "content-type", "application/vnd.api+json")}
  end

  test "shows chosen resource", %{conn: conn} do
    user = Repo.insert! %User{}
    conn = get conn, user_path(conn, :show, user)
    assert json_response(conn, 200)["data"]["attributes"] ==
      %{ "name" => user.name, "email" => user.email }
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, user_path(conn, :show, -1)
    end
  end
end
