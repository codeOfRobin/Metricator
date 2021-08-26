defmodule Metricator.MetricsCase do
  use Metricator.DataCase, async: true

  import Metricator.Factory

  alias Metricator.{Metric, MetricData}

  # _Extremely_ inspired by https://www.tddphoenix.com/showing-a-list-of-chat-rooms/
  describe "all_metrics/0" do
    test "all metrics available" do
      [metric1, metric2] = insert_pair(:metric)

      metrics = MetricData.all_metrics()

      assert metric1 in metrics
      assert metric2 in metrics
    end
  end

  describe "new_metric/0" do
    test "prepares a changeset for a new metric" do
      assert %Ecto.Changeset{} = MetricData.new_metric()
    end
  end

  describe "create_metric/1" do
    test "create a metric" do
      params = string_params_for(:metric)
      {:ok, metric} = MetricData.create_metric(params)
      assert %Metric{} = metric
      assert metric.properties == params["properties"]
    end
  end
end
