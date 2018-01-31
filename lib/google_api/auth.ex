defmodule GoogleApi.Auth do
  def get_token(api) do
    body =
      [
        grant_type: "refresh_token",
        refresh_token: Application.get_env(:google_api, api)[:refresh_token],
        client_id: Application.get_env(:google_api, :oauth2)[:client_id],
        client_secret: Application.get_env(:google_api, :oauth2)[:client_secret]
      ]
      |> URI.encode_query()

    headers = [
      {"Content-Type", "application/x-www-form-urlencoded"}
    ]

    response = HTTPoison.post!(token_url(), body, headers)

    Poison.decode!(response.body)["access_token"]
  end

  defp token_url do
    "https://accounts.google.com/o/oauth2/token"
  end
end
