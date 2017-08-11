defmodule GoogleApi.Adwords do

  def client(client_customer_id) do
    %GoogleApi.AdwordsClient{
      client_customer_id:   client_customer_id,
      client_id:            Application.get_env(:google_api, :oauth2)[:client_id],
      client_secret:        Application.get_env(:google_api, :oauth2)[:client_secret],
      developer_token:      Application.get_env(:google_api, :adwords)[:developer_token],
      user_agent:           Application.get_env(:google_api, :adwords)[:user_agent],
      report_url:           "https://adwords.google.com/api/adwords/reportdownload/v201609"
    }
  end

  def csv_report_with_awql(client, query) do
    GoogleApi.Report.csv_report_with_awql(client, access_token(), query)
  end

  defp access_token do
    GoogleApi.Auth.get_token(:adwords)
  end

end
