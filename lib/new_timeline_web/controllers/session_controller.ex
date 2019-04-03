defmodule NewTimelineWeb.SessionController do
  use NewTimelineWeb, :controller

  def new(conn, _) do
    render(conn, "new.json")
  end

  def create(conn, %{"session" => %{"email" => email, "password" => pass}}) do
    case NewTimelineWeb.Auth.login_by_email_and_pass(conn, email, pass) do
      {:ok, conn} ->
        conn
        # |> put_flash(:info, "Welcome back!")
        |> redirect(to: Routes.pages_path(conn, :index))
      {:error, _reason, conn} ->
        conn
        # |> put_flash(:error, "Invalid email/password combination")
        |> render("new.json")
    end
  end

  def delete(conn, _) do
    conn
    |> NewTimelineWeb.Auth.logout()
    |> redirect(to: Routes.page_path(conn, :index))
  end
end
