defmodule MatchEngine.MatchReport do
  alias MatchEngine.Team

  def generate_report(
        %Team{} = home_team,
        %Team{} = away_team,
        ovr_diff,
        0 = _home_goals,
        0 = _away_goals
      )
      when ovr_diff < 10 and ovr_diff > -10 do
    report = """
    Match Report
    ------------
    #{home_team.name} 0-0 #{away_team.name}

    There wasn't much to write home about as #{home_team.name} and #{away_team.name} played out a 0-0 draw.

    Although there wasn't much to separate the teams before the match, both teams will be disappointed not to have been able to come away with the win.
    """

    IO.puts(report)
  end

  def generate_report(%Team{} = home_team, %Team{} = away_team, _ovr_diff, home_goals, away_goals)
      when home_goals == away_goals do
    report = """
    Match Report
    ------------
    #{home_team.name} #{home_goals}-#{away_goals} #{away_team.name}

    There was nothing to separate #{home_team.name} and #{away_team.name} as they played out a #{home_goals}-#{away_goals} draw.

    Although there wasn't much to separate the teams before the match, both teams will be disappointed not to have been able to come away with the win.
    """

    IO.puts(report)
  end

  def generate_report(%Team{} = home_team, %Team{} = away_team, _ovr_diff, home_goals, away_goals)
      when home_goals > away_goals do
    report = """
    Match Report
    ------------
    #{home_team.name} #{home_goals}-#{away_goals} #{away_team.name}

    It was a match to remember for #{home_team.name} as they came out on top in a thrilling encounter against #{away_team.name}.
    """

    IO.puts(report)
  end

  def generate_report(%Team{} = home_team, %Team{} = away_team, _ovr_diff, home_goals, away_goals)
      when away_goals > home_goals do
    report = """
    Match Report
    ------------
    #{home_team.name} #{home_goals}-#{away_goals} #{away_team.name}

    It was a match to remember for #{away_team.name} as they came away with the win at #{home_team.name}.
    """

    IO.puts(report)
  end
end
