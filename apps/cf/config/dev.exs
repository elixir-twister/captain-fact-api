use Mix.Config

dev_secret = "8C6FsJwjV11d+1WPUIbkEH6gB/VavJrcXWoPLujgpclfxjkLkoNFSjVU9XfeNm6s"

# General config
config :cf,
  frontend_url: "http://localhost:3333",
  cors_origins: "*",
  oauth: [
    facebook: [
      client_id: "506726596325615",
      client_secret: "4b320056746b8e57144c889f3baf0424",
      redirect_uri: "http://localhost:3333/login/callback/facebook"
    ]
  ]

# For development, we disable any cache and enable
# debugging and code reloading.
config :cf, CF.Web.Endpoint,
  secret_key_base: dev_secret,
  debug_errors: false,
  code_reloader: false,
  check_origin: false,
  http: [port: 4000],
  force_ssl: false,
  https: [
    port: 4001,
    otp_app: :cf,
    keyfile: "priv/keys/privkey.pem",
    certfile: "priv/keys/fullchain.pem"
  ]

# Guardian
config :cf,
       CF.Authenticator.GuardianImpl,
       secret_key: dev_secret

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Mails
config :cf, CF.Mailer, adapter: Bamboo.LocalAdapter

# Env / Secrets are above everything else
# Weave loads config from env or secret files
config :weave, loaders: [Weave.Loaders.File, Weave.Loaders.Environment]