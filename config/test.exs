use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :petz, PetStore.Endpoint,
  http: [port: 4001],
  server: true

config :petz, :sql_sandbox, true

config :apocryphal,
  port: 4001,
  host: "localhost",
  serializers: %{
    "application/json" => fn(body) -> Poison.encode!(body) end
  },
  deserializers: %{
    "application/json" => fn(body) -> Poison.decode!(body) end
  }

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :petz, PetStore.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "petz",
  password: "",
  database: "petz_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
