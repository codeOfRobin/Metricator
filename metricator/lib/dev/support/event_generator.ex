defmodule Metricator.EventGenerator do

  defp event(properties, timestamp) do
    %Metricator.Metric {
      properties: properties,
      timestamp: timestamp
    }
  end

  def generate_launch_event(date) do
    event(%{
      "activity" => "user_launch",
      "user_id" => Ecto.UUID.generate(),
    }, date)
  end

  def generate_launch_events_for_past_month() do
    dates = Metricator.DateGenerator.generate_random_timestamps_for_days_ago(30)
    Enum.map(dates, &generate_launch_event/1)
  end

  def save_events(events) do
    for event <- events do
      Metricator.Repo.insert!(event)
    end
  end

  def current_events_count() do
    Metricator.Repo.aggregate(Metricator.Metric, :count)
  end
end
