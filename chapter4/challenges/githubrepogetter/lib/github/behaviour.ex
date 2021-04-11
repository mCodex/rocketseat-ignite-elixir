defmodule Githubrepogetter.Github.Behavior do
  @typep client_result :: {:ok, map()} | {:error, String.t()}

  @callback get_user_repos(String.t()) :: client_result
end
