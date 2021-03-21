defmodule Exflight.Bookings.Report do
  alias Exflight.Bookings.Agent, as: BookingAgent
  alias Exflight.Bookings.Booking

  def generate_report(from_date, to_date, filename \\ "report.csv") do
    bookings = BookingAgent.get_by_interval(from_date, to_date)

    bookings_strings = parse_bookings_result(bookings)

    generate_file(bookings_strings, filename)
  end

  defp parse_bookings_result(bookings) do
    bookings
    |> Enum.map(&booking_to_string/1)
  end

  defp booking_to_string(%Booking{
         id: id,
         id_usuario: id_usuario,
         data_completa: data_completa,
         cidade_origem: cidade_origem,
         cidade_destino: cidade_destino
       }) do
    "#{id}, #{id_usuario}, #{data_completa}, #{cidade_origem}, #{cidade_destino}\n"
  end

  defp generate_file(bookings_string, filename) do
    filename
    |> File.write(bookings_string)
  end
end
