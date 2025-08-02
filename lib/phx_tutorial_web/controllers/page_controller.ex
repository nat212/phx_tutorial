defmodule PhxTutorialWeb.PageController do
  use PhxTutorialWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    # render(conn, :home, layout: false)
    conn
    |> put_status(202)
    |> render(:home, layout: false)
  end
end
