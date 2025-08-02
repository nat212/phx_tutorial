defmodule PhxTutorialWeb.PageController do
  use PhxTutorialWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    conn
    |> put_flash(:error, "Let's pretend we have an error.")
    |> redirect(to: ~p"/redirect_test")
  end

  def redirect_test(conn, _params) do
    conn
    |> render(:home, layout: false)
  end
end
