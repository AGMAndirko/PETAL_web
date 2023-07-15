!/usr/bin/env bash
# For initial setup

docker-compose build
mkdir src
cd src
alias mix="docker-compose run --rm phoenix mix"
mix phx.new . --app bm
mix deps.get
#The following have to be run manually, they give an error when scripted for some reason
sed -i s/'hostname: "localhost"'/'hostname: "db"'/g config/dev.exs
mix ecto.create && mix ecto.migrate
cd ..
docker-compose up

