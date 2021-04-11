defmodule Githubrepogetter.Github.Client do
  use Tesla

  alias Tesla.Env

  @base_url "https://github.com/"

  alias Githubrepogetter.Github.Behavior

  @behaviour Behavior

  plug Tesla.Middleware.JSON

  def get_user_repos(url \\ @base_url, username) do
    "#{url}/users/#{username}/repos"
    |> get()
  end
end
