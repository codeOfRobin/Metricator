ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Metricator.Repo, :manual)
{:ok, _} = Application.ensure_all_started(:ex_machina)
