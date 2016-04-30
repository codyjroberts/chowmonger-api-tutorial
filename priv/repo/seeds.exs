alias Chowmonger.Repo
alias Chowmonger.API.V1.User

admin = %{ name: "Admin", email: "admin@chowmonger.com", password: "password" }

User.changeset(%User{}, admin) |> Repo.insert!
