defmodule NewTimelineWeb.UserController do
  use NewTimelineWeb, :controller

  alias NewTimeline.Accounts
  alias NewTimeline.Accounts.User

  action_fallback NewTimelineWeb.FallbackController

  plug :authenticate when action in [:index, :show]

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    case Accounts.register_user(user_params) do
      {:ok, user} ->
        conn
        |> NewTimelineWeb.Auth.login(user)
        |> put_status(:created)
        |> put_resp_header("location", Routes.user_path(conn, :show, user))
        |> render("show.json", user: user)
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Accounts.get_user!(id)

    with {:ok, %User{} = user} <- Accounts.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)

    with {:ok, %User{}} <- Accounts.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end

  defp authenticate(conn, _opts) do
    if conn.assigns.current_user do
      conn
    else
      conn
      |> put_status(:unauthorized)
      |> render(NewTimelineWeb.ErrorView, "401.json", message: "Unauthenticated user")
      |> halt()
    end
  end
end
