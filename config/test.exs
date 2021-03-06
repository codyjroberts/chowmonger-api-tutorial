use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :chowmonger, Chowmonger.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :chowmonger, Chowmonger.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "chowmonger_test",
  hostname: "localhost",
  template: "template0",
  port: 5433,
  pool: Ecto.Adapters.SQL.Sandbox
