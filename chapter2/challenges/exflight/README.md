# 🏆 Exflight Challenge

## About

The challenge's main goal was to create a flight booking system which user's can book a flight ticket.

## 🖋 Resolution

I created an Elixir's algorithm that stores user's and booking's data in Agents (to simulate a fake database). After that, you can export your data into a report file containing all bookings.

The code is tested using ExMachina's Factory.

## 📚 Libraries:

- Credo
- ExMachina
- Coveralls

## Installation

```bash
mix deps.get
```

## 🏃‍♂️ Running

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

### Generate Booking's Report

```elixir
alias Exflight.Bookings.Report

Report.generate_report("2021-06-25T23:00:00", "2021-06-30T23:00:00", filename // "report.csv")
```
