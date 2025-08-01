defmodule PhxTutorialWeb.HelloController do
  use PhxTutorialWeb, :controller

  def index(conn, _params) do
    render(conn, :index)
  end
end
