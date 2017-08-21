defmodule GoogleApi.AwqlHelper do

  @doc """
  Format a Date to AWQL Format


  ## Examples

      iex> {:ok, d} = Date.new(1990, 8, 28)
      iex> GoogleApi.AwqlHelper.format_date_for_awql(d)
      "19900828"

  """
  def format_date_for_awql(date) do
    Date.to_string(date) |> String.replace("-", "")
  end
end
