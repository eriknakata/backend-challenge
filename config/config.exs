use Mix.Config

config :zx,
  ecto_repos: [Zx.Repo]

config :zx, ZxWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "togulizK8mQLwJJPKnT9eTbIlUiY1WuFpmxM+wnXDRzD7BlSx8C9wR3XLfnihVNU",
  render_errors: [view: ZxWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Zx.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

import_config "#{Mix.env}.exs"
