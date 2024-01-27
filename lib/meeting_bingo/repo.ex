defmodule MeetingBingo.Repo do
  use Ecto.Repo,
    otp_app: :meeting_bingo,
    adapter: Ecto.Adapters.Postgres
end
