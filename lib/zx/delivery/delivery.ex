defmodule Zx.Delivery do
  @moduledoc """
  The Delivery context.
  """

  import Ecto.Query, warn: false
  import Geo.PostGIS
  alias Zx.Repo

  alias Zx.Delivery.Pdv

  @doc """
  Returns the list of pdvs.

  ## Examples

      iex> list_pdvs()
      [%Pdv{}, ...]

  """
  def list_pdvs do
    Repo.all(Pdv)
  end

  @doc """
  Gets a single pdv.

  Raises `Ecto.NoResultsError` if the Pdv does not exist.

  ## Examples

      iex> get_pdv!(123)
      %Pdv{}

      iex> get_pdv!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pdv!(id), do: Repo.get!(Pdv, id)

  @doc """
  Creates a pdv.

  ## Examples

      iex> create_pdv(%{field: value})
      {:ok, %Pdv{}}

      iex> create_pdv(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pdv(attrs \\ %{}) do
    %Pdv{}
    |> Pdv.changeset(attrs)
    |> Repo.insert()
  end

  def search_pdv(point) do
    query = from p in Pdv, 
            where: st_contains(p.coverage_area, ^point),
            limit: 1,
            order_by: st_distance(p.address, ^point)
    
    Repo.all(query)
  end

  
end
