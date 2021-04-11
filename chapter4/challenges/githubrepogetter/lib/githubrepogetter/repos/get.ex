defmodule Githubrepogetter.Repos.Get do
  alias Githubrepogetter.Github.Client

  def show(username) do
    {:ok, response} = Client.get_user_repos(username)

    {:ok,
     response
     |> handle_logic()}
  end

  defp handle_logic(repos) do
    repos
    |> Enum.map(&grab_repos_data/1)
  end

  defp grab_repos_data(%{
         "id" => id,
         "name" => name,
         "description" => description,
         "html_url" => html_url,
         "stargazers_count" => stargazers_count
       }) do
    %{
      id: id,
      name: name,
      description: description,
      html_url: html_url,
      stargazers_count: stargazers_count
    }
  end
end
