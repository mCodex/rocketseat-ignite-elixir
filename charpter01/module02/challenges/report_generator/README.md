# 🏆 Reports Generator Challenge

## About

The challenge's main goal is to read and parse data from this [report](/report/report.csv).

## 🖋 Resolution

I created an Elixir's program that uses:

- Streams
- Enum
- Map

To read, interpret and organize the file's data.

## 📚 Libraries:

- Credo
- Coveralls

## Running

Inside this project run:

```elixir
iex -S mix
```

and then:

```elixir
ReportGenerator.generate_from("report.csv")
```

The tests can be runned by using:

```bash
mix test
```
