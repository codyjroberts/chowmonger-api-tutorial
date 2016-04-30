defmodule Chowmonger.API.V1.UserController do
  use Chowmonger.Web, :controller

  alias Chowmonger.API.V1.User

  plug :scrub_params, "user" when action in [:create, :update]

  def index(conn, _params) do
    users = Repo.all(User)
    render(conn, "index.json", data: users)
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get!(User, id)
    render(conn, "show.json", data: user)
  end
end
