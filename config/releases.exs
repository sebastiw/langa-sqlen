# In this file, we load production configuration and
# secrets from environment variables. You can also
# hardcode secrets, although such is generally not
# recommended and you have to remember to add this
# file to your .gitignore.
import Config

database_url =
  System.get_env("DATABASE_URL") ||
    raise """
    environment variable DATABASE_URL is missing.
    For example: ecto://USER:PASS@HOST/DATABASE
    """

config :langasql, Langasql.Repo,
  ssl: false,
  url: database_url,
  pool_size: String.to_integer(System.get_env("POOL_SIZE", "10"))

secret_key_base =
  System.get_env("SECRET_KEY_BASE") ||
    raise """
    environment variable SECRET_KEY_BASE is missing.
    You can generate one by calling: mix phx.gen.secret
    """

config :langasql, LangasqlWeb.Endpoint,server: true,
  ssl: false,
  secret_key_base: secret_key_base,
  url: [scheme: "https", host: "*", port: String.to_integer(System.get_env("PORT"))],
  http: [:inet6, port: String.to_integer(System.get_env("PORT"))] ||
    raise """
    environment variable PORT is missing.
    For example: ecto:4000
    """
