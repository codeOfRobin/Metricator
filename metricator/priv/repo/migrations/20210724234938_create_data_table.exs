defmodule Metricator.Repo.Migrations.CreateDataTable do
  use Ecto.Migration

  def up do
    create table(:conditions, primary_key: false) do
      add(:time, :naive_datetime, null: false)
      add(:location, :string, null: false)
      add(:temperature, :decimal, null: false)
      add(:humidity, :decimal, null: false)

      timestamps()
    end

    execute("SELECT create_hypertable('conditions', 'time')")
  end

  def down do
    drop(table(:conditions))
  end
end
