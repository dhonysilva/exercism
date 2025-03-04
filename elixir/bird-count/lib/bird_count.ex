defmodule BirdCount do
  def today([]), do: nil

  def today(list) do
    [today | _tail] = list
    today
  end

  def increment_day_count([]), do: [1]

  def increment_day_count(list) do
    [today | tail] = list
    [today + 1 | tail]
  end

  def has_day_without_birds?([0 | _tail]), do: true

  def has_day_without_birds?([]), do: false

  def has_day_without_birds?(list) do
    [_today | tail] = list
    has_day_without_birds?(tail)
  end

  def total(list) do
    total(list, 0)
  end

  defp total([], acc), do: acc

  defp total([today | tail], acc) do
    total(tail, today + acc)
  end

  def busy_days(list) do
    busy_days(list, 0)
  end

  defp busy_days([], acc), do: acc
  defp busy_days([today | tail], acc) when today > 4, do: busy_days(tail, acc + 1)
  defp busy_days([_today | tail], acc), do: busy_days(tail, acc)
end
