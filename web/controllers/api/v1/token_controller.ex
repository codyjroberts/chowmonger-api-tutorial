defmodule Chowmonger.API.V1.TokenController do
  use Chowmonger.Web, :controller

  alias Chowmonger.API.V1.TokenView

  plug :scrub_params, "data" when action in [:create]

  def create(conn, %{"data" => %{"attributes" => token_params }}) do
    case Chowmonger.Token.authenticate(token_params) do
      {:ok, user} ->
        {:ok, jwt, _full_claims} = user |> Guardian.encode_and_sign(:token)
        user = Map.put_new(user, :jwt, jwt)

        conn
        |> put_status(:created)
        |> render("show.json", data: user)
      :error ->
        conn
        |> put_status(:unprocessable_entity)
        |> render("error.json")
    end
  end

  # called from Guardian.Plug.EnsureAuthenticated
  def unauthenticated(conn, params) do
    conn
    |> put_status(:forbidden)
    |> render(TokenView, "forbidden.json", error: "Not Authenticated")
  end

  def unauthorized(conn, params) do
    conn
    |> put_status(:forbidden)
    |> render(TokenView, "forbidden.json", error: "Not Authorized")
  end
end
