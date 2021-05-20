defmodule PruebaparksWeb.Router do
  use PruebaparksWeb, :router

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

  scope "/", PruebaparksWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/parks", ParkController

  end

  # Other scopes may use custom stacks.
  # scope "/api", PruebaparksWeb do
  #   pipe_through :api
  # end
end
