defmodule NewappWeb.PageController do
  use NewappWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
