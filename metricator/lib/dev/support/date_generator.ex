defmodule Metricator.DateGenerator do

  def generate_random_timestamps_for_days_ago(days, from_date, events_per_day_upper_bound \\ 30) do
    Enum.map(0..(days - 1), fn index ->
      older_date = DateTime.add(from_date, -index, :day)

      number_of_timestamps = :rand.uniform(events_per_day_upper_bound)
      Enum.map(0..number_of_timestamps, fn index ->
          DateTime.new(
          Date.new!(older_date.year, older_date.month, index),
          Time.new!(:rand.uniform(12), :rand.uniform(60), :rand.uniform(60))
        )
      end)
    end)
  end
end
