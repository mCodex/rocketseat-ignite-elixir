defmodule Githubrepogetter.Github.ClientTest do
  use ExUnit.Case, async: true

  alias Plug.Conn

  alias Githubrepogetter.Github.Client

  describe "get_user_repos/1" do
    setup do
      bypass = Bypass.open()

      {:ok, bypass: bypass}
    end

    test "should return username's repos info when it is valid", %{bypass: bypass} do
      username = "mcodex"

      url = endpoint_url(bypass.port)

      body = ~s([{
        "description":"Repositório contendo todos os desafios dos módulos do Bootcamp Gostack",
        "html_url":"https://github.com/mCodex/bootcamp-gostack-desafios",
        "id":266806962,
        "name":"bootcamp-gostack-desafios",
        "stargazers_count":0
      }])

      Bypass.expect(bypass, "GET", "/users/#{username}/repos", fn conn ->
        conn
        |> Conn.put_resp_header("content-type", "application/json")
        |> Conn.resp(200, body)
      end)

      response = Client.get_user_repos(url, username)

      expected_response =
        {:ok,
         [
           %{
             "description" =>
               "Repositório contendo todos os desafios dos módulos do Bootcamp Gostack",
             "html_url" => "https://github.com/mCodex/bootcamp-gostack-desafios",
             "id" => 266_806_962,
             "name" => "bootcamp-gostack-desafios",
             "stargazers_count" => 0
           }
         ]}

      assert response == expected_response
    end

    test "should return error when username is invalid", %{bypass: bypass} do
      username = "invalid_username"

      url = endpoint_url(bypass.port)

      Bypass.expect(bypass, "GET", "/users/#{username}/repos", fn conn ->
        Conn.resp(conn, 400, '')
      end)

      response = Client.get_user_repos(url, username)

      expected_response = {
        :error,
        %{
          message: "Username not found",
          status: :bad_request
        }
      }

      assert response == expected_response
    end

    defp endpoint_url(port), do: "http://localhost:#{port}"
  end
end
