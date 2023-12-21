defmodule MatchEngine do
  alias Faker
  alias MatchEngine.Team
  alias Statistics

  def simulate_game(%Team{} = home_team, %Team{} = away_team) do
    # stats = get_stats(home_team, away_team) |> IO.inspect(charlists: :as_lists, label: "Stats")
    # skewness = get_away_multiplier(stats) |> IO.inspect(label: "Skewness")
    # home_ovr = calculate_ovr_rating(home_team) * 1.1 |> IO.inspect(label: "OVR Rating home")
    # away_ovr = calculate_ovr_rating(away_team) * skewness |> IO.inspect(label: "OVR Rating away")
    home_ovr = calculate_ovr_rating(home_team) * 1.1
    away_ovr = calculate_ovr_rating(away_team)
    ovr_diff = home_ovr - away_ovr |> IO.inspect(label: "OVR Diff")
    {home_goals, away_goals, _momentum} =
      0..90
      |> Enum.reduce({0, 0, 0}, fn _, {_home_goals, _away_goals, _momentum} = acc ->
        {home_goals, away_goals, momentum} = acc
        momentum = if event_occurs?(abs(ovr_diff), 100) do momentum + 1 else momentum - 1 end
        IO.inspect(momentum, label: "Momentum")
        if momentum < 0 do
          maybe_get_goals(home_ovr, home_goals, away_ovr, away_goals, momentum, :home)
        else
          maybe_get_goals(home_ovr, home_goals, away_ovr, away_goals, momentum, :away)
        end
      end)

    "#{home_team.name} #{home_goals}-#{away_goals} #{away_team.name}"
  end

  defp event_occurs?(rating, max \\ 10000), do: Faker.random_between(0, max) <= rating

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

  defp calculate_ovr_rating(%Team{} = team), do:
    (team.gk_rating + team.def_rating + team.mid_rating + team.att_rating + team.manager_rating + team.reputation) / 6

  # defp get_away_multiplier(stats) do
  #   skew = Statistics.skew(stats) |> IO.inspect(label: "Skew")
  #   if skew < 0 do
  #     (skew / 2) + 1
  #   else
  #     skew
  #   end
  # end

  # defp get_stats(%Team{} = home_team, %Team{} = away_team) do
  #   home_values = Map.from_struct(home_team)
  #   |> Map.delete(:name)
  #   |> Map.values()
  #   |> Enum.sort()

  #   IO.inspect(home_values, charlists: :as_lists)

  #   away_values = Map.from_struct(away_team)
  #   |> Map.delete(:name)
  #   |> Map.values()
  #   |> Enum.sort()

  #   IO.inspect(away_values, charlists: :as_lists)

  #   home_values ++ away_values
  # end
end
