defmodule GithubrepogetterWeb.ReposController do
  use GithubrepogetterWeb, :controller

  def show(conn, %{"username" => username}) do
    with {:ok, repos} <- Githubrepogetter.repo_get(username) do
      conn
      |> put_status(:ok)
      |> render("repos.json", repos: repos)
    end
  end
end
