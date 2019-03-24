defmodule NewTimelineWeb.Router do
  use NewTimelineWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", NewTimelineWeb do
    pipe_through :api
  end
end
