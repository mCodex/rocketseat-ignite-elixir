ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Githubrepogetter.Repo, :manual)

Mox.defmock(Githubrepogetter.Github.ClientMock, for: Githubrepogetter.Github.Behavior)
