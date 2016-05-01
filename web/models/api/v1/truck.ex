defmodule Chowmonger.API.V1.Truck do
  use Chowmonger.Web, :model

  schema "trucks" do
    field :name, :string
    field :lat, :float
    field :lng, :float
    field :image, :string
    field :menu, {:array, :string}
    field :status, :boolean, default: false
    field :categories, {:array, :string}
    belongs_to :user, Chowmonger.API.V1.User

    timestamps
  end

  @required_fields ~w(name lat lng categories)
  @optional_fields ~w(status menu image)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
