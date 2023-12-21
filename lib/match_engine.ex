defmodule MatchEngine do
  alias Faker
  alias MatchEngine.Team

  def simulate_game(%Team{} = home_team, %Team{} = away_team) do
    {home_goals, away_goals} =
      0..90
      |> Enum.reduce({0, 0}, fn _, {home_goals, away_goals} = acc ->
        cond do
          random_with_chance(home_team.rating) -> {home_goals + 1, away_goals}
          random_with_chance(away_team.rating) -> {away_goals + 1, home_goals}
          true -> acc
        end
      end)

    "#{home_team.name} #{home_goals}-#{away_goals} #{away_team.name}"
  end

  defp random_with_chance(chance), do: Faker.random_between(0, 10000) <= chance
end
