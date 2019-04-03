defmodule NewTimelineWeb.UserView do
  use NewTimelineWeb, :view
  alias NewTimelineWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      username: user.username,
      name: user.name,
      is_active: user.is_active}
  end

  # def render("new.json", %{changeset: changeset}) do
  #   %{username: user.username,
  #     name: user.name,
  #     is_active: user.is_active,
  #     credential: %{
  #     }
  #   }
  # end
end
