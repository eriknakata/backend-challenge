use Mix.Config

config :zx, ZxWeb.Endpoint,
  http: [port: 4001],
  server: false

config :logger, level: :warn

config :zx, Zx.Repo,
  adapter: Ecto.Adapters.Postgres,
  types: Zx.PostgresTypes,
  username: "postgres",
  password: "postgres",
  database: "zx_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
