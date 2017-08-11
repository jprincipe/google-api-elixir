defmodule GoogleApi.Report do

  def csv_report_with_awql(client, access_token, query) do
    body = [
      __rdquery: query,
      __fmt: "CSV"
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

    byte_size(HTTPoison.post!(client.report_url, body, headers, options).body)
  end

end
