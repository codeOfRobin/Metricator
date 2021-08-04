defmodule MetricatorWeb.MetricController do
  use MetricatorWeb, :controller

  def create(conn, params) do
    json(conn, params)
  end
end
