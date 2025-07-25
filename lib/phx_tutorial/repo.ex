defmodule PhxTutorial.Repo do
  use Ecto.Repo,
    otp_app: :phx_tutorial,
    adapter: Ecto.Adapters.Postgres
end
