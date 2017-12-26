defmodule Zx.Delivery.Pdv do
  use Ecto.Schema
  import Ecto.Changeset
  alias Zx.Delivery.Pdv


  schema "pdvs" do
    field :document, :string
    field :owner_name, :string
    field :trading_name, :string
    field :address, Geo.Point
    field :coverage_area, Geo.MultiPolygon

    timestamps()
  end

  @doc false
  def changeset(%Pdv{} = pdv, attrs) do
    pdv
    |> cast(attrs, [:trading_name, :owner_name, :document, :address, :coverage_area])
    |> validate_required([:trading_name, :owner_name, :document, :address, :coverage_area])
    |> validate_cnpj
    |> unique_constraint(:document)
  end

  defp validate_cnpj(changeset) do
    cnpj = %Cnpj{number: get_change(changeset, :document)}

    if !is_nil(cnpj.number) && Brcpfcnpj.cnpj_valid?(cnpj) do
      changeset
    else 
      changeset |> add_error(:document, "Invalid CNPJ")
    end
    
  end
end
