defmodule Chowmonger.API.V1.UserController do
  use Chowmonger.Web, :controller

  plug Guardian.Plug.EnsureAuthenticated, handler: Chowmonger.API.V1.TokenController

  def index(conn, _) do
    user = Guardian.Plug.current_resource(conn)
    render(conn, "index.json", data: user)
  end

  def show(conn, _) do
    case decode_and_verify_token(conn) do
      {:ok, _claims} ->
        user = Guardian.Plug.current_resource(conn)

        conn
        |> put_status(:ok)
        |> render("show.json", data: user)
      {:error, _reason} ->
        conn
        |> put_status(:not_found)
        |> render("errors.json", data: "Not found")
    end
  end

  defp decode_and_verify_token(conn) do
    conn
    |> Guardian.Plug.current_token
    |> Guardian.decode_and_verify
  end
end
