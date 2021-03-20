# Exflight

## Installation

```bash
mix deps.get
```

## Running

First you need to open this project on your terminal and then:

```elixir
iex -S mix
```

Then you will be able to use the following commands.

### User

#### Saving an User

```elixir
alias Exflight.Users.CreateOrUpdate
alias Exflight.Users.Agent, as: UserAgent

UserAgent.start_link(%{})

CreateOrUpdate.call(%{ name: "John Doe", email: "john_doe@test.com", cpf: "12345" })
```

#### Getting an User

```elixir
UserAgent.get("USER_ID")
```

### Booking

#### Saving a Booking

```elixir
alias Exflight.Bookings.CreateOrUpdate, as: BookingCreate
alias Exflight.Bookings.Agent, as: BookingAgent

BookingAgent.start_link(%{})

BookingCreate.call("USER_ID", %{data: "2021-06-25T23:00:00", cidade_origem: "São Paulo", cidade_destino: "Florianópolis"})
```

#### Getting a specific Booking

```elixir
BookingAgent.get("BOOKING_ID")
```
