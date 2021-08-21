defmodule MetricatorWeb.MetricController do
  use MetricatorWeb, :controller

  alias Metricator.MetricData

  def create(conn, params) do
    case MetricData.create_metric(params) do
      {:ok, metric} ->
        json(conn, params)
      {:error }
    end
  end
end
