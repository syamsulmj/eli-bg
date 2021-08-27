defmodule EliBg.Repo do
  use Ecto.Repo,
    otp_app: :eli_bg,
    adapter: Ecto.Adapters.Postgres
end
