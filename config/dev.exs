use Mix.Config

config :zx, ZxWeb.Endpoint,
  http: [port: 4000],
  debug_errors: false,
  code_reloader: true,
  check_origin: false,
  watchers: []

config :logger, :console, format: "[$level] $message\n"
config :phoenix, :stacktrace_depth, 20

config :zx, Zx.Repo,
  adapter: Ecto.Adapters.Postgres,
  types: Zx.PostgresTypes,
  username: System.get_env("DB_USERNAME"),
  password: System.get_env("DB_PASSWORD"),
  database: "zx_dev",
  hostname: System.get_env("DB_HOST"),
  pool_size: 10
