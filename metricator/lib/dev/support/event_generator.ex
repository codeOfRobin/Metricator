defmodule Metricator.EventGenerator do

  defp event(properties, timestamp) do
    %Metricator.Metric {
      properties: properties,
      timestamp: timestamp
    }
  end


  def generate_launch_events_for_past_month() do
    dates = Metricator.DateGenerator.generate_random_timestamps_for_days_ago(30)
    Enum.map(dates, fn date ->
      event(%{
        "activity" => "user_launch",
        "user_id" => Ecto.UUID.generate(),
      }, date)
    end)
  end
end
