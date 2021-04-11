defmodule Githubrepogetter do
  alias Githubrepogetter.Repos.Get, as: RepoGet

  defdelegate repo_get(username), to: RepoGet, as: :show
end
