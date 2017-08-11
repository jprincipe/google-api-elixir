defmodule GoogleApi.Report do

  def report_with_awql(client, access_token, query) do
    body = [
      __rdquery: query,
      __fmt: "CSV"
    ] |> URI.encode_query

    headers = [
      {"Content-Type", "application/x-www-form-urlencoded"},
      {"Authorization", "Bearer #{access_token}"},
      {"User-Agent", "QueroBolsa (AwApi-Ruby/0.22.0, Common-Ruby/0.12.6, GoogleAdsSavon/1.0.2, ruby/2.3.1, HTTPI/2.4.2, httpclient)"},
      {"clientCustomerId", client.client_customer_id},
      {"developerToken", client.developer_token},
      {"skipReportHeader", "true"},
      {"skipReportSummary", "true"},
      {"skipColumnHeader", "true"},
    ]

    HTTPoison.post!(client.report_url, body, headers).body
  end

end
