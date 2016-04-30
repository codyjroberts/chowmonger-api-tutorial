defmodule Chowmonger.API.V1.TokenController do
  use Chowmonger.Web, :controller

  plug :scrub_params, "session" when action in [:create]

  def create(conn, %{ "data" => %{ "attributes" => token_params } }) do
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

  def unauthenticated(conn, _params) do
    conn
    |> put_status(:forbidden)
    |> render(Chowmonger.TokenView, "forbidden.json", error: "Not Authenticated")
  end
end
