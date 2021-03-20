defmodule Exflight.Bookings.CreateOrUpdate do
  alias Exflight.Bookings.Agent, as: BookingAgent
  alias Exflight.Users.Agent, as: UserAgent

  alias Exflight.Bookings.Booking

  def call(id_usuario, %{
        data: data,
        cidade_origem: cidade_origem,
        cidade_destino: cidade_destino
      }) do
    id = UUID.uuid4()

    with {:ok, _user} <- UserAgent.get(id_usuario),
         {:ok, naive_date} <- convert_date_to_naive(data),
         {:ok, booking} <-
           Booking.build(id, naive_date, cidade_origem, cidade_destino, id_usuario) do
      BookingAgent.save(booking)
    else
      error -> error
    end
  end

  defp convert_date_to_naive(date) do
    case NaiveDateTime.from_iso8601(date) do
      {:error, _reason} -> {:error, "Invalid date"}
      naive_date -> naive_date
    end
  end
end
