defmodule Githubrepogetter.Repos.Get do
  alias Githubrepogetter.Github.Client

  def show(username) do
    username
    |> Client.get_user_repos(username)
    |> IO.inspect()
  end
end
