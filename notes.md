# Initial Setup
```
$ mix phx.new new-timeline --app new_timeline --module NewTimeline --no-html --no-webpack

$ mix phx.gen.context Auth User users email:string:unique is_active:boolean

mix phx.gen.json Auth User users email:string password:string \
is_active:boolean --no-context --no-schema
```

# Common Commands
```
$ mix phx.server
$ mix ecto.create
$ mix ecto.migrate
$ mix ecto.drop
$ MIX_ENV=test mix ecto.drop
$ iex -S mix phx.server
```
