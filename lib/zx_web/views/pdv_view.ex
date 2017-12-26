defmodule ZxWeb.PdvView do
  use ZxWeb, :view
  alias ZxWeb.PdvView

  def render("index.json", %{pdvs: pdvs}) do
    render_many(pdvs, PdvView, "pdv.json")
  end

  def render("show.json", %{pdv: pdv}) do
    render_one(pdv, PdvView, "pdv.json")
  end

  def render("pdv.json", %{pdv: pdv}) do
    %{id: pdv.id,
      trading_name: pdv.trading_name,
      owner_name: pdv.owner_name,
      document: pdv.document,
      address: Geo.JSON.encode(pdv.address),
      coverage_area: Geo.JSON.encode(pdv.coverage_area)
    }
  end
end
