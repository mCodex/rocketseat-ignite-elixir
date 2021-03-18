defmodule Exflight.Users.Agent do
  alias Exflight.Users.User

  use Agent

  def start_link(_initial_state), do: Agent.start_link(fn -> %{} end, name: __MODULE__)

  def save(%User{} = user), do: Agent.update(__MODULE__, &update_user(&1, user))

  def get(user_id), do: Agent.get(__MODULE__, &get_user(&1, user_id))

  defp get_user(state, id) do
    case Map.get(state, id) do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end

  defp update_user(users, %User{id: user_id} = user), do: Map.put(users, user_id, user)
end
