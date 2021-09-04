defmodule Metricator.EventGenerator do
  import Ecto
  alias Ecto.Repo

  defp event(properties, timestamp) do
    %Metricator.Metric {
      properties: properties,
      timestamp: timestamp
    }
  end


  def generate_launch_events_for_past_month() do

  end
end
