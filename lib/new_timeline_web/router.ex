defmodule NewTimelineWeb.Router do
  use NewTimelineWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug :fetch_session
    # plug :protect_from_forgery
    plug NewTimelineWeb.Auth
  end

  scope "/api", NewTimelineWeb do
    pipe_through :api
    resources "/users", UserController, except: [:edit]
    resources "/sessions", SessionController, only: [:new, :create, :delete]
  end
end
