defmodule NewTimelineWeb.Auth do
  import Plug.Conn

  alias NewTimeline.Accounts

  # init in a plug module allows plug
  # to accept compile time options
  # (as opposed to just run time options)
  def init(opts), do: opts

  def call(conn, _opts) do
    user_id = get_session(conn, :user_id)
    user = user_id && Accounts.get_user(user_id)
    assign(conn, :current_user, user)
  end

  def login(conn, user) do
    conn
    |> assign(:current_user, user)
    |> put_session(:user_id, user.id)
    |> configure_session(renew: true)
    # renew sends session cookie back to client with different identifer
  end

  def login_by_email_and_pass(conn, email, given_pass) do
    case Accounts.authenticate_by_email_and_pass(email, given_pass) do
      {:ok, user} -> {:ok, login(conn, user)}
      {:error, :unauthorized} -> {:error, :unauthorized, conn}
      {:error, :not_found} -> {:error, :not_found, conn}
    end
  end

  def logout(conn) do
    configure_session(conn, drop: true)
    # could also keep session but delete user id w/
    # delete_session(conn, :user_id)
  end
end
