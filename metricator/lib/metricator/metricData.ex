defmodule Metricator.MetricData do
  alias Metricator.{Metric, Repo}

  def all_metrics() do
    Metric |> Repo.all()
  end

  def new_metric() do
    %Metric{} |> Metric.changeset(%{})
  end

  def create_metric(params) do
    %Metric{}
    |> Metric.changeset(params)
    |> Repo.insert()
  end
end
