defmodule Metricator.MetricData do
  alias Metricator.{Metric, Repo}

  def all_metrics() do
    Metricator.Metric |> Repo.all()
  end
end
