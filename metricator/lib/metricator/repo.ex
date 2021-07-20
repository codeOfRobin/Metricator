defmodule Metricator.Repo do
  use Ecto.Repo,
    otp_app: :metricator,
    adapter: Ecto.Adapters.Postgres
end
