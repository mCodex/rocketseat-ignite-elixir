defmodule Exflight.Factory do
  use ExMachina

  alias Exflight.Bookings.Booking
  alias Exflight.Users.User

  def user_factory() do
    id = UUID.uuid4()

    %User{
      id: id,
      name: "John Doe",
      email: "john_doe@test.com",
      cpf: "123456"
    }
  end

  def booking_factory() do
    id = UUID.uuid4()
    user_id = UUID.uuid4()

    {:ok, date} = NaiveDateTime.from_iso8601("2021-05-20T23:00:00")

    %Booking{
      id: id,
      data_completa: date,
      cidade_origem: "São Paulo",
      cidade_destino: "Florianópolis",
      id_usuario: user_id
    }
  end
end
