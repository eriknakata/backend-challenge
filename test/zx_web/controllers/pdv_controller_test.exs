defmodule ZxWeb.PdvControllerTest do
  use ZxWeb.ConnCase

  @create_attrs %{document: "71877007000134", owner_name: "Zé da Silva", trading_name: "Adega da Cerveja - Pinheiros", 
    address: %{type: "Point", coordinates: [-46.57421, -21.785741]},
    coverage_area: %{type: "MultiPolygon", coordinates: [
      [[[30, 20], [45, 40], [10, 40], [30, 20]]], 
      [[[15, 5], [40, 10], [10, 20], [5, 10], [15, 5]]]
    ]}
  }
  @invalid_attrs %{document: nil, owner_name: nil, trading_name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "create pdv" do
    test "renders pdv when data is valid", %{conn: conn} do
      conn = post conn, pdv_path(conn, :create), @create_attrs
      assert %{"id" => id} = json_response(conn, 201)
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, pdv_path(conn, :create), pdv: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end
end