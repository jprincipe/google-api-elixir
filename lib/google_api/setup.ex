defmodule GoogleApi.Setup do
  def get_auth_url(scope) do
    client =
      OAuth2.Client.new(
        strategy: OAuth2.Strategy.AuthCode,
        client_id: Application.get_env(:google_api, :oauth2)[:client_id],
        client_secret: Application.get_env(:google_api, :oauth2)[:client_secret],
        redirect_uri: "urn:ietf:wg:oauth:2.0:oob:auto",
        token_url: "https://accounts.google.com/o/oauth2/token",
        authorize_url: "https://accounts.google.com/o/oauth2/auth",
        params: %{
          scope: Application.get_env(:google_api, scope)[:scope]
        }
      )

    IO.puts("=======================================================")
    IO.puts("Here goes your link: \n")
    IO.puts(OAuth2.Client.authorize_url!(client))
    IO.puts("\n=======================================================\n\n")
    client
  end

  def get_token(client, url) do
    uri = URI.parse(url)

    {_, code} =
      uri.query |> URI.query_decoder()
      |> Enum.find(fn e -> match?({"approvalCode", _}, e) end)

    additional_params = [
      code: code,
      client_id: Application.get_env(:google_api, :oauth2)[:client_id],
      client_secret: Application.get_env(:google_api, :oauth2)[:client_secret]
    ]

    OAuth2.Client.get_token!(client, additional_params).token.refresh_token
  end
end
