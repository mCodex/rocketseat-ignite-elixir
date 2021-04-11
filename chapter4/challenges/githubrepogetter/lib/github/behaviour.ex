defmodule Githubrepogetter.Github.Behavior do
  @typep client_result :: {:ok, map()} | {:error, String.t()}

  @callback get_users_repo(String.t()) :: client_result
end
