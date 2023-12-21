defmodule MatchEngine do
  alias Faker

  alias MatchEngine.{
    MatchReport,
    Team
  }

  def simulate_game(%Team{} = home_team, %Team{} = away_team) do
    home_ovr = calculate_ovr_rating(home_team) * 1.1
    away_ovr = calculate_ovr_rating(away_team)
    ovr_diff = (home_ovr - away_ovr) |> IO.inspect(label: "OVR Diff")

    {home_goals, away_goals, _momentum} =
      0..90
      |> Enum.reduce({0, 0, 0}, fn _, {_home_goals, _away_goals, _momentum} = acc ->
        {home_goals, away_goals, momentum} = acc
        momentum = calculate_momentum(momentum, ovr_diff)

        if momentum < 1 do
          maybe_get_goals(home_ovr, home_goals, away_ovr, away_goals, momentum, :home)
        else
          maybe_get_goals(home_ovr, home_goals, away_ovr, away_goals, momentum, :away)
        end
      end)

    MatchReport.generate_report(home_team, away_team, ovr_diff, home_goals, away_goals)
  end

  defp event_occurs?(rating, max \\ 10000), do: Faker.random_between(0, max) <= rating

  defp calculate_momentum(momentum, ovr_diff) do
    cond do
      ovr_diff <= 0 and event_occurs?(abs(ovr_diff), 100) -> momentum + 1
      ovr_diff > 0 and event_occurs?(ovr_diff, 100) -> momentum - 1
      true -> momentum
    end
  end

  defp maybe_get_goals(home_ovr, home_goals, away_ovr, away_goals, momentum, :home) do
    cond do
      event_occurs?(home_ovr) -> {home_goals + 1, away_goals, momentum}
      event_occurs?(away_ovr) -> {away_goals + 1, home_goals, momentum}
      true -> {home_goals, away_goals, momentum}
    end
  end

  defp maybe_get_goals(home_ovr, home_goals, away_ovr, away_goals, momentum, :away) do
    cond do
      event_occurs?(away_ovr) -> {away_goals + 1, home_goals, momentum}
      event_occurs?(home_ovr) -> {home_goals + 1, away_goals, momentum}
      true -> {home_goals, away_goals, momentum}
    end
  end

  defp calculate_ovr_rating(%Team{} = team),
    do:
      (team.gk_rating + team.def_rating + team.mid_rating + team.att_rating + team.manager_rating +
         team.reputation) / 6
end
