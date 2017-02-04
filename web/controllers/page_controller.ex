defmodule RssHerder.PageController do
  use RssHerder.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
