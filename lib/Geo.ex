Postgrex.Types.define(Zx.PostgresTypes,
            [Geo.PostGIS.Extension] ++ Ecto.Adapters.Postgres.extensions(),
            json: Poison)