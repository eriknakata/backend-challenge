defmodule ZxWeb.PdvController do
  use ZxWeb, :controller

  alias Zx.Delivery
  alias Zx.Delivery.Pdv

  action_fallback ZxWeb.FallbackController

  def create(conn, pdv_params) do
    with {:ok, %Pdv{} = pdv} <- Delivery.create_pdv(pdv_params) do
      conn
      |> put_status(:created)
      |> render("show.json", pdv: pdv)
    end
  end

  def show(conn, %{"id" => id}) do
    pdv = Delivery.get_pdv!(id)
    render(conn, "show.json", pdv: pdv)
  end

  def search_pdv(conn, coordinates) do
    pdvs = %Geo.Point{ coordinates: {coordinates["lat"], coordinates["lng"]}}
    |> Delivery.search_pdv
    render(conn, "index.json", pdvs: pdvs)
  end
end
