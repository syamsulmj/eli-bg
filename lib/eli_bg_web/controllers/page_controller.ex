defmodule EliBgWeb.PageController do
  use EliBgWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
