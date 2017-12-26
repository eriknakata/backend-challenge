defmodule Zx.Repo.Migrations.CreatePdvs do
  use Ecto.Migration

  def change do
    create table(:pdvs) do
      add :trading_name, :string, size: 50
      add :owner_name, :string, size: 50
      add :document, :char, size: 14
      add :address, :geometry
      add :coverage_area, :geometry

      timestamps()
    end

    create unique_index(:pdvs, [:document])
  end
end
