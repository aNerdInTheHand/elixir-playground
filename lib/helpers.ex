defmodule MatchEngine.Helpers do
  def format_record_results(home_team, away_team, {home_goals, away_goals} = _score) do
    "#{home_team} #{home_goals}-#{away_goals} #{away_team}"
  end

  def calculate_biggest_home_win(
        {home_goals, away_goals} = result,
        {record_home_goals, record_away_goals} = record
      ) do
    if home_goals - away_goals > record_home_goals - record_away_goals do
      result
    else
      record
    end
  end

  def calculate_biggest_away_win(
        {home_goals, away_goals} = result,
        {record_home_goals, record_away_goals} = record
      ) do
    if away_goals - home_goals > record_away_goals - record_home_goals do
      result
    else
      record
    end
  end

  def calculate_highest_scoring_game(result, record) do
    if Tuple.sum(result) > Tuple.sum(record) do
      result
    else
      record
    end
  end

  def construct_result_struct(match_result, acc) do
    score = {match_result.home_goals, match_result.away_goals}

    %{
      home_wins:
        acc.home_wins + if(match_result.home_goals > match_result.away_goals, do: 1, else: 0),
      away_wins:
        acc.away_wins + if(match_result.away_goals > match_result.home_goals, do: 1, else: 0),
      draws: acc.draws + if(match_result.home_goals == match_result.away_goals, do: 1, else: 0),
      home_goals: acc.home_goals + match_result.home_goals,
      away_goals: acc.away_goals + match_result.away_goals,
      highest_home_goals:
        if(match_result.home_goals > acc.highest_home_goals,
          do: match_result.home_goals,
          else: acc.highest_home_goals
        ),
      highest_away_goals:
        if(match_result.away_goals > acc.highest_away_goals,
          do: match_result.away_goals,
          else: acc.highest_away_goals
        ),
      biggest_home_win: calculate_biggest_home_win(score, acc.biggest_home_win),
      biggest_away_win: calculate_biggest_away_win(score, acc.biggest_away_win),
      highest_scoring_game: calculate_highest_scoring_game(score, acc.highest_scoring_game),
      results: [match_result | acc.results]
    }
  end

  def construct_match_series_struct(home_team, away_team, results, num_matches) do
    %{
      home_team: home_team,
      away_team: away_team,
      home_wins: results.home_wins,
      away_wins: results.away_wins,
      draws: results.draws,
      home_goals: results.home_goals,
      away_goals: results.away_goals,
      highest_home_goals: results.highest_home_goals,
      highest_away_goals: results.highest_away_goals,
      biggest_home_win: format_record_results(home_team, away_team, results.biggest_home_win),
      biggest_away_win: format_record_results(home_team, away_team, results.biggest_away_win),
      highest_scoring_game:
        format_record_results(home_team, away_team, results.highest_scoring_game),
      average_score: "#{results.home_goals / num_matches}-#{results.away_goals / num_matches}"
    }
  end
end
