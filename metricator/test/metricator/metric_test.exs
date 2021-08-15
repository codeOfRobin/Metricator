defmodule Metricator.MetricsCase do
  use Metricator.DataCase, async: true

  import Metricator.Factory

  alias Metricator.MetricData

  # _Extremely_ inspired by https://www.tddphoenix.com/showing-a-list-of-chat-rooms/
  describe "all_metrics/0" do
    test "all metrics available" do
      [metric1, metric2] = insert_pair(:metric)

      metrics = MetricData.all_metrics()

      assert metric1 in metrics
      assert metric2 in metrics
    end
  end

end
