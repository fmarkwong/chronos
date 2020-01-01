defmodule ChronosWeb.PageController do
  use ChronosWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
