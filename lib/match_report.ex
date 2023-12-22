defmodule MatchEngine.MatchReport do
  alias MatchEngine.{
    MatchReportSummaries,
    Team
  }

  def generate_report(
        %Team{} = home_team,
        %Team{} = away_team,
        ovr_diff,
        home_goals,
        away_goals
      ) do
    winner = determine_winner(home_goals, away_goals) |> IO.inspect(label: "Winner")
    surprise_factor = determine_surprise_factor(ovr_diff, winner) |> IO.inspect(label: "Surprise Factor")

    report = generate_match_report(home_team.name, away_team.name, home_goals, away_goals, winner, surprise_factor)

    IO.puts(report)
  end

  def generate_match_report(home_team, away_team, home_goals, away_goals, winner, surprise_factor) do
    report_header = print_report_header_and_score(home_team, away_team, home_goals, away_goals)
    report_body = cond do
      winner == :draw and surprise_factor == 0 -> MatchReportSummaries.draw_responses(surprise_factor, home_team, away_team, home_goals, away_goals) |> Enum.random()
      winner == :draw and surprise_factor == 1 -> MatchReportSummaries.draw_responses(surprise_factor, home_team, away_team, home_goals, away_goals) |> Enum.random()
      winner == :draw and surprise_factor == 2 -> MatchReportSummaries.draw_responses(surprise_factor, home_team, away_team, home_goals, away_goals) |> Enum.random()
      winner == :draw and surprise_factor == 3 -> MatchReportSummaries.draw_responses(surprise_factor, home_team, away_team, home_goals, away_goals) |> Enum.random()
      winner == :draw and surprise_factor == 4 -> MatchReportSummaries.draw_responses(surprise_factor, home_team, away_team, home_goals, away_goals) |> Enum.random()
      winner == :draw and surprise_factor == 5 -> MatchReportSummaries.draw_responses(surprise_factor, home_team, away_team, home_goals, away_goals) |> Enum.random()
      winner == :home and surprise_factor == 0 -> MatchReportSummaries.home_win_responses(surprise_factor, home_team, away_team, home_goals, away_goals) |> Enum.random()
      winner == :home and surprise_factor == 1 -> MatchReportSummaries.home_win_responses(surprise_factor, home_team, away_team, home_goals, away_goals) |> Enum.random()
      winner == :home and surprise_factor == 2 -> MatchReportSummaries.home_win_responses(surprise_factor, home_team, away_team, home_goals, away_goals) |> Enum.random()
      winner == :home and surprise_factor == 3 -> MatchReportSummaries.home_win_responses(surprise_factor, home_team, away_team, home_goals, away_goals) |> Enum.random()
      winner == :home and surprise_factor == 4 -> MatchReportSummaries.home_win_responses(surprise_factor, home_team, away_team, home_goals, away_goals) |> Enum.random()
      winner == :home and surprise_factor == 5 -> MatchReportSummaries.home_win_responses(surprise_factor, home_team, away_team, home_goals, away_goals) |> Enum.random()
      winner == :away and surprise_factor == 0 -> MatchReportSummaries.away_win_responses(surprise_factor, home_team, away_team, home_goals, away_goals) |> Enum.random()
      winner == :away and surprise_factor == 1 -> MatchReportSummaries.away_win_responses(surprise_factor, home_team, away_team, home_goals, away_goals) |> Enum.random()
      winner == :away and surprise_factor == 2 -> MatchReportSummaries.away_win_responses(surprise_factor, home_team, away_team, home_goals, away_goals) |> Enum.random()
      winner == :away and surprise_factor == 3 -> MatchReportSummaries.away_win_responses(surprise_factor, home_team, away_team, home_goals, away_goals) |> Enum.random()
      winner == :away and surprise_factor == 4 -> MatchReportSummaries.away_win_responses(surprise_factor, home_team, away_team, home_goals, away_goals) |> Enum.random()
      winner == :away and surprise_factor == 5 -> MatchReportSummaries.away_win_responses(surprise_factor, home_team, away_team, home_goals, away_goals) |> Enum.random()
    end

    """
    #{report_header}
    #{report_body}
    """
  end

  defp print_report_header_and_score(home_team, away_team, home_goals, away_goals) do
    """

    Match Report
    ------------
    #{home_team} #{home_goals}-#{away_goals} #{away_team}
    """
  end

  defp determine_winner(home_goals, away_goals) when home_goals > away_goals, do: :home
  defp determine_winner(home_goals, away_goals) when away_goals > home_goals, do: :away
  defp determine_winner(_home_goals, _away_goals), do: :draw

  defp determine_surprise_factor(ovr_diff, winner) when winner == :home do
    cond do
      ovr_diff > 20 -> 0
      ovr_diff > -5 -> 1
      ovr_diff > -15 -> 2
      ovr_diff > -30 -> 3
      ovr_diff > -40 -> 4
      ovr_diff > -60 -> 5
      true -> 0
    end
  end

  defp determine_surprise_factor(ovr_diff, winner) when winner == :away do
    cond do
      ovr_diff < -20 -> 0
      ovr_diff < 0 -> 1
      ovr_diff < 5 -> 2
      ovr_diff < 35 -> 3
      ovr_diff < 50 -> 4
      ovr_diff <= 65 -> 5
      true -> 0
    end
  end

  defp determine_surprise_factor(ovr_diff, winner) when winner == :draw do
    cond do
      abs(ovr_diff) > 50 -> 5
      abs(ovr_diff) > 10 -> 2
      abs(ovr_diff) >= 0 -> 0
      true -> 0
    end
  end
end
