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
    plug :accepts, ["json"]
  end

  scope "/api", Chowmonger do
    pipe_through :api

    scope "/v1" do

    end
  end
end
