defmodule ZxWeb.Router do
  use ZxWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ZxWeb do
    pipe_through :api

    get "/pdvs", PdvController, :search_pdv
    get "/pdvs/:id", PdvController, :show
    post "/pdvs", PdvController, :create
  end
end
