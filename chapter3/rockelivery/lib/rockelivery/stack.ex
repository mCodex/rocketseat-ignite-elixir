# Just an example showing how to use GenServer.
# The code below does not have anything related to our main business logic.

defmodule Rockelivery.Stack do
  use GenServer

  # Client

  def start_link(initial_stack) when is_list(initial_stack) do
    GenServer.start(__MODULE__, initial_stack)
  end

  def push(pid, element) do
    GenServer.cast(pid, {:push, element})
  end

  def pop(pid) do
    GenServer.call(pid, :pop)
  end

  # Server (Callbacks)

  @impl true
  def init(stack) do
    {:ok, stack}
  end

  @impl true
  # Sync
  def handle_call({:push, element}, _from, stack) do
    updated_stack = [element | stack]
    {:reply, updated_stack, updated_stack}
  end

  @impl true
  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  @impl true
  def handle_call(:pop, _from, []) do
    {:reply, nil, []}
  end

  @impl true
  # Async
  def handle_cast({:push, element}, stack) do
    {:noreply, [element | stack]}
  end
end
