defmodule PhoenixGuardianWeb.SessionController do
  use PhoenixGuardianWeb, :controller

  alias PhoenixGuardian.Accounts.User

  def login(conn, %{"email" => email, "password" => password}) do
    case User.find_and_confirm_password(email, password) do
      {:ok, user} ->
         {:ok, jwt, _full_claims} = Guardian.encode_and_sign(user, :api)

         conn
         |> render("login.json", user: user, jwt: jwt)
      {:error, _reason} ->
        conn
        |> put_status(401)
        |> render("error.json", message: "Could not login")
    end
  end

end
