defmodule Scoreboard.Router do
  use Scoreboard.Web, :router

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

  scope "/", Scoreboard do
    pipe_through :browser # Use the default browser stack

    get "/", MainController, :index
    get "/:challenge", MainController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", Scoreboard do
  #   pipe_through :api
  # end
end
