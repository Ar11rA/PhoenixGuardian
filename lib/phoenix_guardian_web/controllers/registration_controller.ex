defmodule PhoenixGuardianWeb.RegistrationController do
  use PhoenixGuardianWeb, :controller

  alias PhoenixGuardian.Accounts.User
  alias PhoenixGuardian.Repo

  def register(conn, %{"user" => user_params}) do
    changeset = User.registration_changeset(%User{}, user_params)

    case Repo.insert(changeset) do
      {:ok, user} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", user_path(conn, :show, user))
        |> render("success.json", user: user)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(PhoenixGuardianWeb.ChangesetView, "error.json", changeset: changeset)
    end
  end

end
