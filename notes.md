# Initial Setup
```
$ mix phx.new new-timeline --app new_timeline --module NewTimeline --no-html --no-webpack

$ mix phx.gen.context Accounts User users username:string:unique name:string is_active:boolean

mix phx.gen.json Accounts User users username:string name:string is_active:boolean --no-context --no-schema

```

# Common Commands
```
$ mix phx.server
$ mix ecto.create
$ mix ecto.migrate
$ mix ecto.drop
$ MIX_ENV=test mix ecto.drop
$ iex -S mix phx.server
