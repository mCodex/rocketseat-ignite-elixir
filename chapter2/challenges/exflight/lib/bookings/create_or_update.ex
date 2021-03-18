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
         {:ok, booking} <- Booking.build(id, data, cidade_origem, cidade_destino, id_usuario) do
      BookingAgent.save(booking)
    else
      error -> error
    end
  end
end
