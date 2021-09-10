defmodule Metricator.DateGenerator do

  def generate_random_timestamps_for_days_ago(days, from_date \\ DateTime.utc_now(), events_per_day_upper_bound \\ 30) do
    Enum.flat_map(0..(days - 1), fn index ->
      older_date = Timex.shift(from_date, days: -index)

      number_of_timestamps = :rand.uniform(events_per_day_upper_bound)
      Enum.map(0..number_of_timestamps, fn _index ->
        DateTime.new!(
          older_date |> DateTime.to_date(),
          Time.new!(:rand.uniform(23), :rand.uniform(59), :rand.uniform(59), :rand.uniform(1000000))
        )
      end)
    end)
  end
end
