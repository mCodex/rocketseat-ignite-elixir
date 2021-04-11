defmodule Githubrepogetter.Github.Client do
  use Tesla

  alias Tesla.Env

  @base_url "https://api.github.com"

  alias Githubrepogetter.Github.Behavior

  @behaviour Behavior

  plug Tesla.Middleware.Headers, [{"user-agent", "tesla"}]
  plug Tesla.Middleware.JSON

  def get_user_repos(url \\ @base_url, username) do
    "#{url}/users/#{username}/repos"
    |> get()
    |> handle_get()
  end

  defp handle_get({:ok, %Env{status: 200, body: body}}) do
    {:ok, body}
  end

  defp handle_get({:ok, %Env{status: 400, body: _body}}) do
    {:error, %{status: :bad_request, message: "Username not found"}}
  end
end
