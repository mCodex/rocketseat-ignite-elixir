defmodule Exflight.Bookings.Agent do
  alias Exflight.Bookings.Booking

  use Agent

  def start_link(_initial_state), do: Agent.start_link(fn -> %{} end, name: __MODULE__)

  def save(%Booking{id: booking_id} = booking) do
    Agent.update(__MODULE__, &update_booking(&1, booking))

    {:ok, booking_id}
  end

  def get(booking_id), do: Agent.get(__MODULE__, &get_booking(&1, booking_id))

  def get_by_interval(from_date, to_date),
    do: Agent.get(__MODULE__, &get_reports_by_interval(&1, from_date, to_date))

  defp get_booking(state, booking_id) do
    case Map.get(state, booking_id) do
      nil -> {:error, "Flight Booking not found"}
      booking -> {:ok, booking}
    end
  end

  defp get_reports_by_interval(state, from_date, to_date) do
    bookings_list = Map.values(state)

    bookings_list
    |> Enum.filter(&filter_reports_by_interval(&1, from_date, to_date))
  end

  defp filter_reports_by_interval(booking, from_date, to_date) do
    {:ok, from_date_naive} = NaiveDateTime.from_iso8601(from_date)
    {:ok, to_date_naive} = NaiveDateTime.from_iso8601(to_date)

    from_date_comparison = NaiveDateTime.compare(booking.data_completa, from_date_naive)
    to_date_comparison = NaiveDateTime.compare(booking.data_completa, to_date_naive)

    (from_date_comparison == :gt or from_date_comparison == :eq) and
      (to_date_comparison == :lt or to_date_comparison == :eq)
  end

  defp update_booking(state, %Booking{id: booking_id} = booking),
    do: Map.put(state, booking_id, booking)
end
