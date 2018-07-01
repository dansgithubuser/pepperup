defmodule PepperupWeb.Router do
  use PepperupWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PepperupWeb do
    pipe_through :api
  end
end
