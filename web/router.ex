defmodule Chowmonger.Router do
  use Chowmonger.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json-api"]
    plug JaSerializer.ContentTypeNegotiation
    plug JaSerializer.Deserializer
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
  end

  scope "/api", Chowmonger do
    pipe_through :api

    scope "/v1", alias: API.V1 do
      resources "users", UserController, only: [:index, :show]
      post "token", TokenController, :create
    end
  end
end
