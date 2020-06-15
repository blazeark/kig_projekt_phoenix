defmodule PageWeb.PageController do
  use PageWeb, :controller

  def index(conn, _params) do
    IO.puts(Routes)
    render conn, "index.html", token: get_csrf_token()
  end

  def new(conn, _params) do
    {:ok, body, conn} = Plug.Conn.read_body(conn)
    form  = Map.get(_params, "form", %{})
    email = Map.get(form, "email", "test@example.com")
    file = Map.get(form, "file", "test@example.com")
    GenServer.cast(Jobber, {:job, email, file})
    render conn, "thank.html"
  end
end
