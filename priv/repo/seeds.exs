# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
alias PhoenixGuardian.Repo
alias PhoenixGuardian.Accounts.User

changeset = User.changeset(%User{}, %{
  "email": "john@mail.com",
  "name": "John Doe",
  "phone": "033-64-22",
  "password": "MySuperPa55"
})
Repo.insert!(changeset)
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
