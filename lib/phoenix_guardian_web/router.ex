defmodule PhoenixGuardianWeb.Router do
  use PhoenixGuardianWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
  end

  pipeline :authenticated do
    plug Guardian.Plug.EnsureAuthenticated
  end

  scope "/api", PhoenixGuardianWeb do
    pipe_through :api

    post "/register", RegistrationController, :register
    post "/login", SessionController, :login

    pipe_through :authenticated
    resources "/users", UserController, except: [:new, :edit]
  end
end
