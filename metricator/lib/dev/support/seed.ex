defmodule Metricator.Seed do
  import Ecto
  alias Metricator.Repo


  def generate_timestamp_in_current_month() do
    current_day = DateTime.utc_now()

    timestamps = Enum.map(1..current_day.day, fn index ->
      DateTime.new{
        Date.new!(current_day.year, current_day.month, index),
        Time.new!(:rand.uniform(12), :rand.uniform(60), :rand.uniform(60))
      }
    end)


  end

  defp user_activity_event_properties() do
    %{
      "userID" => Ecto.UUID.generate(),
      "activity" => "launch"
    }
  end

  defp event(properties, timestamp) do
    %Metricator.Metric {
      properties: properties,
      timestamp: timestamp
    }
  end
end
