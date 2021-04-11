defmodule Githubrepogetter.ReposController do
  use GithubrepogetterWeb, :controller

  def show(conn, %{"username" => username}) do
    with {:ok, repo} <- Githubrepogetter.repo_get(username) do
      conn
      |> put_status(:ok)
      |> render("repo.json", repo: repo)
    end
  end
end
