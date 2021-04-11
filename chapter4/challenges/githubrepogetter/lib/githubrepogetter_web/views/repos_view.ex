defmodule GithubrepogetterWeb.ReposView do
  use GithubrepogetterWeb, :view

  def render("repo.json", %{
        id: id,
        name: name,
        description: description,
        html_url: html_url,
        stargazers_count: stargazers_count
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
