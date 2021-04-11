defmodule GithubrepogetterWeb.ReposView do
  use GithubrepogetterWeb, :view

  def render("repos.json", %{repos: repos}), do: repos
end
