
alias Bmapp.{Watcher, Repo}

paul = %Bmapp.Watcher.User{} |> Bmapp.Watcher.User.changeset(%{name: "Paul",userid: "paul",email: "paul@gmail.com",
  password: "paul", role: "admin"}) |> Bmapp.Repo.insert!

location1 =
  %Watcher.Location {loc_name: "BM Amsterdam", user: paul}
  |> Repo.insert!

location2 =
  %Watcher.Location {loc_name: "BM Rotterdam", user: paul}
  |> Repo.insert!


sensor11 =
  %Watcher.Sensor {s_name: "Sensor 11", gtype: 1, location: location1}
  |> Repo.insert!

Watcher.genmes(sensor11)

sensor12 =
  %Watcher.Sensor {s_name: "Sensor 12", gtype: 2, location: location1}
  |> Repo.insert!

Watcher.genmes(sensor12)

sensor13 =
  %Watcher.Sensor {s_name: "Sensor 13", gtype: 2, location: location1}
  |> Repo.insert!

Watcher.genmes(sensor13)

sensor14 =
  %Watcher.Sensor {s_name: "Sensor 14", gtype: 1, location: location1}
  |> Repo.insert!

Watcher.genmes(sensor14)

sensor15 =
  %Watcher.Sensor {s_name: "Sensor 15", gtype: 2, location: location1}
  |> Repo.insert!

Watcher.genmes(sensor15)

sensor16 =
  %Watcher.Sensor {s_name: "Sensor 16", gtype: 1, location: location1}
  |> Repo.insert!

Watcher.genmes(sensor16)



sensor21 =
  %Watcher.Sensor {s_name: "Sensor 21", gtype: 1, location: location2}
  |> Repo.insert!

Watcher.genmes(sensor21)

sensor22 =
  %Watcher.Sensor {s_name: "Sensor 22", gtype: 2, location: location2}
  |> Repo.insert!

Watcher.genmes(sensor22)
