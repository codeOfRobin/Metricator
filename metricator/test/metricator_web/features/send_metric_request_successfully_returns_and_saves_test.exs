defmodule MetricatorWeb.SendMetricSuccesfullyTest do
  use MetricatorWeb.ConnCase, async: true

  test "user sends dictionary to API and it is recorded successfully", %{conn: conn} do
    currentTime = DateTime.utc_now() |> DateTime.to_iso8601()
    metric_data = %{
      "properties" => %{"foo" => "bar"},
      "timestamp" => currentTime
    }
    conn = post(build_conn(), "/record", metric_data)
    assert json_response(conn, 200) == %{
      "properties" => %{"foo" => "bar"},
      "timestamp" => currentTime
    }
  end
end
