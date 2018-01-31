# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

# This configuration is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project. For this reason,
# if you want to provide default values for your application for
# 3rd-party users, it should be done in your "mix.exs" file.

# You can configure for your application as:
#
#     config :google_api, key: :value
#
# And access this configuration in your application as:
#
#     Application.get_env(:google_api, :key)
#
# Or configure a 3rd-party app:
#
#     config :logger, level: :info
#

# example values
# config :google_api, :oauth2,
#   client_id: "172345676919-ff89g1d3e4off4gf31bbpo3plhcvbmfp.apps.googleusercontent.com",
#   client_secret: "3TfikwcyVwhPoIuECX3NMH9x"

# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per environment
# by uncommenting the line below and defining dev.exs, test.exs and such.
# Configuration from the imported file will override the ones defined
# here (which is why it is important to import them last).
#
#     import_config "#{Mix.env}.exs"

config :google_api, :oauth2,
  client_id: "172114372919-ff89g1d3e4oaa4gf31evpo3plhcvbmfp.apps.googleusercontent.com",
  client_secret: "3TfijwcyVwhJlKtECX3NMH6x"

config :google_api, :adwords,
  developer_token: "ndnWF3Uf7tUOI7UHpX71rQ",
  user_agent: "QueroBolsa",
  scope: "https://www.googleapis.com/auth/adwords",
  refresh_token: "1/ArTNK7r5zoSJNKvrqr_hbNxrVUulR12wTl_inSnWnps"

# refresh_token: "1/WLaGGnROTCtYSf7k-JWvdE4o5nnrzvdkcP3K-wehSiNIgOrJDtdun6zK6XiATCKT"
