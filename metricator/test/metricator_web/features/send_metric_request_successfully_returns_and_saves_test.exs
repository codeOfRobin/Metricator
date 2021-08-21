defmodule MetricatorWeb.SendMetricSuccesfullyTest do
  use MetricatorWeb.ConnCase, async: true

  alias Metricator.MetricData

  test "user sends dictionary to API and it is recorded successfully", %{conn: conn} do
    currentTime = DateTime.utc_now() |> DateTime.to_unix(:microsecond)

    metric_data = %{
      "properties" => %{"foo" => "bar"},
      "timestamp" => currentTime
    }

    conn = post(build_conn(), "/record", metric_data)

    assert json_response(conn, 200) == %{
             "properties" => %{"foo" => "bar"},
             "timestamp" => currentTime
           }

    [metric | _] = MetricData.all_metrics()
    assert metric.properties == metric_data["properties"]
    assert metric.timestamp == metric_data["timestamp"]
  end
end
