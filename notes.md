# Initial Setup
```
$ mix phx.new new-timeline --app new_timeline --module NewTimeline --no-html --no-webpack

$ mix phx.gen.context Auth User users email:string:unique is_active:boolean
```

# Common Commands
```
$ mix phx.server
$ mix ecto.create
$ mix ecto.drop
$ MIX_ENV=test mix ecto.drop
```
