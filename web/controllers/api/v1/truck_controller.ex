defmodule Chowmonger.API.V1.TruckController do
  use Chowmonger.Web, :controller

  alias Chowmonger.API.V1.Truck
  alias Chowmonger.Repo
  alias Guardian.Plug.EnsurePermissions

  plug EnsurePermissions, [handler: Chowmonger.API.V1.TokenController] when action in [:update]

  plug :scrub_params, "data" when action in [:update]

  def index(conn, _params) do
    trucks = Repo.all(Truck)
    render(conn, "index.json", data: trucks)
  end

  def show(conn, %{"id" => id}) do
    truck = Repo.get!(Truck, id)
    render(conn, "show.json", data: truck)
  end

  def update(conn, %{"data" => %{"attributes" => truck_params}, "id" => id}) do
    truck = Repo.get!(Truck, id)
    changeset = Truck.changeset(truck, truck_params)

    case Repo.update(changeset) do
      {:ok, truck} ->
        render(conn, "show.json", data: truck)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Chowmonger.ChangesetView, "error.json", changeset: changeset)
    end
  end
end
