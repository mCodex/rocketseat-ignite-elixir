# 🏆 Queue

## About

The challenge's main goal was to simulate a queue using Elixir's GenServer.

## Installation

```bash
mix deps.get
```

## 🏃‍♂️ Running

Open your terminal and then:

```bash
iex -S mix
```

After that, you can do:

```bash
iex> {:ok, pid} = Queue.start_link(initial_state) # ex: Queue.start_link([1,2,3])
{:ok, #PID<0.122.0>}

iex> Queue.enqueue(pid, 5)
:ok

iex> Queue.dequeue(pid)
1
```
