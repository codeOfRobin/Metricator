defmodule Metricator.Metric do
  use Ecto.Schema
  import Ecto.Changeset

  schema "metrics" do
    field :properties, :map
    field :timestamp, :naive_datetime, virtual: true
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:properties, :time])
  end
end
