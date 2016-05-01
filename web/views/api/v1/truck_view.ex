defmodule Chowmonger.API.V1.TruckView do
  use Chowmonger.Web, :view

  attributes [:name, :lat, :lng, :image, :menu, :categories, :status]
end
