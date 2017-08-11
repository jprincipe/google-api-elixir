# GoogleApi Elixir

A Work In progress Google Api Client for access google services with Elixir :heart:

Available Features:

- OAuth2 Authentication
- Reports with AWQL

Desired Features

- All Reports Suported
- All other services - Even SOAP based

## Installation

Just add as dependency in `mix.exs` :

```elixir
def deps do
  [{:google_api, github: "giovanecosta/google-api-elixir"}]
end
```

**When** [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `google_api` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:google_api, "~> 0.1.0"}]
end
```

## Setup

1. In `config.exs` file, add your credentials:

```elixir
config :google_api, :oauth2,
  client_id: "xxxxxx-xxxxxxxxxxxxx.apps.googleusercontent.com",
  client_secret: "xxxxxxxxxoIuECX3NMH9x",

```
For each API you need to use, a configuration must be done like:
```elixir
config :google_api, :adwords,
  developer_token: "ndnWxxxxxxxxxHpX71rQ",
  user_agent: "YourApplication",
  scope: "https://www.googleapis.com/auth/adwords"
  refresh_token: "" # Leave blank for now

```
2. Run `iex -S mix` on your project
3. Call `GoogleApi.Setup.get_auth_url` passing the desired scope (pre-configured like above). Ex.: `:adwords`
```elixir
client = GoogleApi.Setup.get_auth_url(:adwords)

```
4. Go to generated url and follow the steps to authorize
5. After authorize, copy the current url (If everything is ok, it must have a `approvalCode` param)
6. Call `GoogleApi.Setup.get_token` passing `client` var above and the url:
```elixir
iex(1)> token = GoogleApi.Setup.get_token(client, "https://accounts.google.com/o/oauth2/approval/v2/approvalnativeapp?auto=true&response=code%3D4%2Fg4tC1mxxxxxxx&approvalCode=4%2Fg4tC1m9uNQxxxxxxxxWxGB3Bzv0")
"xxxxxxxxxxxYUuyvi87tyur7tuT&U8u9"
```
7. Copy the token and paste in `refresh_token` config (once left blank)
```elixir
config :google_api, :adwords,
  developer_token: "ndnWxxxxxxxxxHpX71rQ",
  user_agent: "YourApplication",
  scope: "https://www.googleapis.com/auth/adwords"
  refresh_token: "xxxxxxxxxxxYUuyvi87tyur7tuT&U8u9"

```



Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/google_api](https://hexdocs.pm/google_api).

