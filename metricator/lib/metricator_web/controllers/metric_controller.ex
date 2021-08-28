defmodule MetricatorWeb.MetricController do
  use MetricatorWeb, :controller

  alias Metricator.MetricData

  def create(conn, params) do
    %{"timestamp" => unix_timestamp} = params
    cast_timestamp = unix_timestamp |> DateTime.from_unix!(:microsecond)

    case MetricData.create_metric(%{params | "timestamp" => cast_timestamp}) do
      {:ok, metric} ->
        json(conn, params)

      {:error} ->
        conn
        |> put_status(400)
        |> json(%{error: "bad request"})
    end
  end
end
