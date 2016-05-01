alias Chowmonger.Repo
alias Chowmonger.API.V1.User

user = %{ name: "Admin", email: "admin@chowmonger.com", password: "password" }

truck = %{
           name: "Jim Bob's Shrimp Stand",
           lat: 41.8820989,
           lng: -87.6242104,
           image: "https://upload.wikimedia.org/wikipedia/commons/8/8d/Seattle_-_Maximus_Minimus_food_truck_03.jpg",
           menu: ["Shrimp Stew", "Shrimp Gumbo", "Shrimp Kabob"],
           categories: ["Creole", "Southern"],
           status: true
         }

truck2 = %{
            name: "Don't Nuts",
            lat: 41.8830989,
            lng: -87.6442104,
            image: "https://upload.wikimedia.org/wikipedia/commons/e/e5/Claire_et_Hugo_food_truck.JPG",
            menu: ["Crispy Nuts", "Salty Nuts", "Sweet Nuts", "Spicy Nuts", "Mixed Nuts"],
            categories: ["Nuts... what else?"],
            status: true
          }

truck3 = %{
            name: "Burgers and Peaches",
            lat: 41.8720989,
            lng: -87.6212104,
            image: "https://upload.wikimedia.org/wikipedia/commons/e/e3/Food_truck_in_London.jpg",
            categories: ["Beef", "Fruit"],
            menu: ["The Peachy Burger", "Poached Peaches a la mode"],
            status: true
          }

User.changeset(%User{}, user)
|> Repo.insert!
|> Ecto.build_assoc(:truck, truck)
|> Repo.insert!

Repo.one(User)
|> Ecto.build_assoc(:truck, truck2)
|> Repo.insert!

Repo.one(User)
|> Ecto.build_assoc(:truck, truck3)
|> Repo.insert!
