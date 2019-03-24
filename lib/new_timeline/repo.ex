defmodule NewTimeline.Repo do
  use Ecto.Repo,
    otp_app: :new_timeline,
    adapter: Ecto.Adapters.Postgres
end
