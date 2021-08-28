defmodule Metricator.Metric do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false

  schema "metrics" do
    field :properties, :map
    field :timestamp, :utc_datetime_usec
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:properties, :timestamp])
  end
end
