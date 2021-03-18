defmodule Exflight.Bookings.Agent do
  alias Exflight.Bookings.Booking

  use Agent

  def start_link(_initial_state), do: Agent.start_link(fn -> %{} end, name: __MODULE__)

  def save(%Booking{} = booking), do: Agent.update(__MODULE__, &update_booking(&1, booking))

  def get(booking_id), do: Agent.get(__MODULE__, &get_booking(&1, booking_id))

  defp get_booking(state, booking_id) do
    case Map.get(state, booking_id) do
      nil -> {:error, "Flight Booking not found"}
      booking -> {:ok, booking}
    end
  end

  defp update_booking(state, %Booking{id: id} = booking), do: Map.put(state, id, booking)
end
