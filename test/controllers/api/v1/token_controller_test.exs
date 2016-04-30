defmodule Chowmonger.API.V1.TokenControllerTest do
  use Chowmonger.ConnCase

  alias Chowmonger.API.V1.User

  @valid_attrs %{"token" =>
                  %{
                    email: "some content",
                    password: "some content"
                  }
                }

  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/vnd.api+json")}
    {:ok, conn: put_req_header(conn, "content-type", "application/vnd.api+json")}
  end
end
