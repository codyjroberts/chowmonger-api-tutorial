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
    {:ok, conn: put_req_header(conn, "content-type", "application/vnd.api+json")}
  end
end
