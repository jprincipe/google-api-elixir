defmodule GoogleApi.Report do
  alias NimbleCSV.RFC4180, as: CSV

  def csv_report_with_awql(client, access_token, query) do
    {:ok, pid} = StringIO.open(report_with_awql(client, access_token, query, "CSV").body)

    IO.stream(pid, :line) |>
    CSV.parse_stream
  end


  def report_with_awql(client, access_token, query, format) do
    body = [
      __rdquery: query,
      __fmt: format
    ] |> URI.encode_query

    headers = [
      {"Content-Type", "application/x-www-form-urlencoded"},
      {"Authorization", "Bearer #{access_token}"},
      {"User-Agent", "#{client.user_agent} (GoogleApiElixir/0.1.0, httpclient)"},
      {"clientCustomerId", client.client_customer_id},
      {"developerToken", client.developer_token},
      {"skipReportHeader", "true"},
      {"skipReportSummary", "true"},
      {"skipColumnHeader", "true"},
    ]

    options = [
      recv_timeout: :infinity
    ]

    HTTPoison.post!(client.report_url, body, headers, options)
  end

end
