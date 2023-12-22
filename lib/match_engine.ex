defmodule MatchEngine do
  alias Faker

  alias MatchEngine.{
    MatchReport,
    Team,
    Teams
  }

  @doc """
  Simulate a specified number of matches between random teams.

  Prints match reports to the console.

  Returns `:ok`.

  ## Examples

      iex> MatchEngine.simulate_many_random(20)
  """
  def simulate_many(%Team{} = home_team, %Team{} = away_team, num_matches \\ 10) do
    Enum.map(1..num_matches, fn _ ->
      simulate_game(home_team, away_team)
    end)
  end

  def simulate_many_random(num_matches \\ 10) do
    Enum.map(1..num_matches, fn _ ->
      [home_team, away_team | _rest] = Enum.shuffle(Teams.teams())
      simulate_game(home_team, away_team)
    end)
  end

  def simulate_game(%Team{} = home_team, %Team{} = away_team) do
    home_ovr = calculate_ovr_rating(home_team) * 1.1
    away_ovr = calculate_ovr_rating(away_team)
    ovr_diff = (home_ovr - away_ovr)

    {home_goals, away_goals, _momentum} =
      0..90
      |> Enum.reduce({0, 0, 0}, fn _, {_home_goals, _away_goals, _momentum} = acc ->
        {home_goals, away_goals, momentum} = acc
        momentum = calculate_momentum(momentum, ovr_diff)

        if momentum < 1 do
          maybe_get_goals(
            home_ovr + abs(momentum),
            home_goals,
            away_ovr,
            away_goals,
            momentum,
            :home
          )
        else
          maybe_get_goals(home_ovr, home_goals, away_ovr + momentum, away_goals, momentum, :away)
        end
      end)

    MatchReport.generate_report(home_team, away_team, ovr_diff, home_goals, away_goals)
  end

  defp event_occurs?(rating, max \\ 10000), do: Faker.random_between(0, max) <= rating

  @doc """
  Change the momentum of a match based on the difference in overall rating between the two teams.
  The higher rated team will have a greater chance of increasing their momentum.
  Momentum is a value between -100 and 100, with 0 being neutral.
  Momentum < 0 means the home team is on top, momentum > 0 means the away team is on top.
  Maximum momentum is 5, minimum is -5. It is hard for the away team to build momentum.
  """
  defp calculate_momentum(momentum, ovr_diff) do
    cond do
      # home team is stronger
      ovr_diff >= 0 and event_occurs?(ovr_diff, 200) -> max(-5, momentum - 1)
      # away team is stronger
      ovr_diff < 0 and event_occurs?(abs(ovr_diff), 500) -> min(momentum + 1, 5)
      true -> momentum
    end
  end

  defp maybe_get_goals(home_ovr, home_goals, away_ovr, away_goals, momentum, :home) do
    cond do
      event_occurs?(home_ovr) -> {home_goals + 1, away_goals, 0}
      event_occurs?(away_ovr) -> {home_goals, away_goals + 1, 0}
      true -> {home_goals, away_goals, momentum}
    end
  end

  defp maybe_get_goals(home_ovr, home_goals, away_ovr, away_goals, momentum, :away) do
    cond do
      event_occurs?(away_ovr) -> {home_goals, away_goals + 1, 0}
      event_occurs?(home_ovr) -> {home_goals + 1, away_goals, 0}
      true -> {home_goals, away_goals, momentum}
    end
  end

  defp calculate_ovr_rating(%Team{} = team),
    do:
      (team.gk_rating + team.def_rating + team.mid_rating + team.att_rating + team.manager_rating +
         team.reputation) / 6
end
