defmodule Metricator.Repo.Migrations.CreateDataTable do
  use Ecto.Migration

  def up do
    create table(:metrics, primary_key: false) do
      add(:timestamp, :naive_datetime, null: false)
      add(:properties, :map, null: false)
    end

    execute("SELECT create_hypertable('metrics', 'timestamp')")
  end

  def down do
    drop(table(:metrics))
  end
end
