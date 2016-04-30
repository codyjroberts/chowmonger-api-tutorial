defmodule Chowmonger.API.V1.TokenView do
  use Chowmonger.Web, :view

  attributes [:name, :email, :jwt]
end
