defmodule PhoenixGuardianWeb.RegistrationView do
  use PhoenixGuardianWeb, :view

  def render("success.json", %{user: user}) do
    %{
      status: :ok,
      email: user.email,
      message: "User registered successfully!"
    }
  end
end
