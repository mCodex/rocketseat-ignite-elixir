# 🏆 Mealcon Challenge

## About

The challenge's main goal was to create a meal tracker api where you can save/delete/update/show a meal.

Mealcon means meal consumption.

## 📚 Libraries:

- Phoenix
- Credo
- ExMachina
- Coveralls

## Installation

```bash
mix deps.get
```

## 🏃‍♂️ Running

First you need to make sure that you have postgres installed locally or if you have docker you can run:

```bash
docker-compose up -d
```

And then on your terminal and then:

```elixir
mix phx.server
```

## Testing

Just run:

```elixir
mix test
```

The coverage is over 90%.

## 🔗 Endpoints

There is a [insomnia.json](./docs/insomnia.json) here which you can import into your Insomnia.

Base url: http://localhost:4000

### Create

POST `/api/meals`

payload:

```json
{
  "description": "A beautiful meal description",
  "date": "2021-04-02 19:00",
  "calories": 200
}
```

### Update

PUT `/api/meals/MEAL_ID`

payload:

```json
{
  "description": "A beautiful meal description",
  "date": "2021-04-02 19:00",
  "calories": 200
}
```

### Show

GET `/api/meals/MEAL_ID`

### Delete

DELETE `/api/meals/MEAL_ID`
