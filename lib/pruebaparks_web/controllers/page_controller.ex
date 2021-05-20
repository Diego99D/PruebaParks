defmodule PruebaparksWeb.PageController do
  use PruebaparksWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
