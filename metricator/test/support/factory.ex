defmodule Metricator.Factory do
  use ExMachina.Ecto, repo: Metricator.Repo

  def metric_factory do
    properties = %{
      "index" => sequence("event_index")
    }

    %Metricator.Metric{
      properties: properties,
      timestamp: DateTime.utc_now() |> DateTime.to_iso8601()
    }
  end
end
