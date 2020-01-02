defmodule ChronosWeb.SessionController do
  use ChronosWeb, :controller

  alias Chronos.Accounts

  def new(conn, _) do
    render(conn, "new.html")
  end

  # TODO: use changeset and error tag in new.html instead
  def create(conn, %{"user" => %{"email" => ""}}) do
    flash_error(conn, "Please enter email address")
  end

  def create(conn, %{"user" => %{"password" => ""}}) do
    flash_error(conn, "Please enter password")
  end

  def create(conn, %{"user" => %{"email" => email, "password" => password}}) do
    case Accounts.authenticate_by_email_password(email, password) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Welcome back!")
        |> put_session(:user_id, user.id)
        |> configure_session(renew: true)
        |> redirect(to: "/")

      {:error, _} ->
        flash_error(conn, "Bad email/password combination")
    end
  end

  def delete(conn, _) do
    conn
    |> configure_session(drop: true)
    |> redirect(to: "/")
  end

  defp flash_error(conn, message) do
    conn
    |> put_flash(:error, message)
    |> redirect(to: Routes.session_path(conn, :new))
  end
end
