# PhoenixGuardian - API only example

To start your Phoenix API only server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Start Phoenix endpoint with `mix phx.server`

Routes: 

Run `mix phx.routes` to view existing routes

```sh
phoenix_guardian~ git:(master) mix phx.routes

registration_path  POST    /api/register   PhoenixGuardianWeb.RegistrationController :register
     session_path  POST    /api/login      PhoenixGuardianWeb.SessionController :login
        user_path  GET     /api/users      PhoenixGuardianWeb.UserController :index
        user_path  GET     /api/users/:id  PhoenixGuardianWeb.UserController :show
        user_path  POST    /api/users      PhoenixGuardianWeb.UserController :create
        user_path  PATCH   /api/users/:id  PhoenixGuardianWeb.UserController :update
                   PUT     /api/users/:id  PhoenixGuardianWeb.UserController :update
        user_path  DELETE  /api/users/:id  PhoenixGuardianWeb.UserController :delete
```

To generate files:

1. Migration

`mix ecto.gen.migration <name-of-migration>`

2. Controller with RESTful structure

```mix phx.gen.json Accounts User users email:string name:string phone:string password_hash:string is_admin:boolean```

Otherwise for normal controllers, you can simply create file with name `<purpose_of_controller>_controller.ex` like session_controller or registration_controller

3. Ecto Schema

```mix phx.gen.schema Blog.Post blog_posts title views:integer```