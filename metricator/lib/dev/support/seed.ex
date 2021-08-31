defmodule Metricator.Seed do
  import Ecto
  alias Metricator.Repo


  def generate_timestamp_in_current_month(index) do
    current_day =
    %DateTime{
      %Date{

      }
    }
  end

  defp user_activity_event_properties() do
    %{
      "userID" => Ecto.UUID.generate()
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
