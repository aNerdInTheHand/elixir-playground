defmodule MatchEngine.MatchReportSummaries do
  def home_win_responses(5 = _surprise_factor, home_team, away_team, home_goals, away_goals),
    do: [
      """
      Against all the odds, #{home_team} pulled off a giant killing with a #{home_goals}-#{away_goals} win over #{away_team}.
      """,
      """
      In a result that will go down in the history books, #{home_team} stunned #{away_team} with a #{home_goals}-#{away_goals} win.
      Whilst questions will undoubtedly be asked of the visitors, in reality this was all about #{home_team} and their incredible performance.
      """
    ]

  def home_win_responses(4 = _surprise_factor, home_team, away_team, home_goals, away_goals),
    do: [
      """
      There was a shock today when #{home_team} pulled off a #{home_goals}-#{away_goals} win at home to #{away_team}.
      """,
      """
      In a result that nobody could have predicted, #{home_team} stunned #{away_team} with a #{home_goals}-#{away_goals} win.
      """
    ]

  def home_win_responses(3 = _surprise_factor, home_team, away_team, home_goals, away_goals),
    do: [
      """
      There was something of a surprise today when #{away_team} travelled to #{home_team} in confident mood.
      However, it was the hosts who triumphed with a #{home_goals}-#{away_goals} win
      """,
      """
      Underdogs #{home_team} put their home advantage to good effect, beating #{away_team} #{home_goals}-#{away_goals}.
      """
    ]

  def home_win_responses(2 = _surprise_factor, home_team, away_team, home_goals, away_goals),
    do: [
      """
      There was a shock today when #{home_team} pulled off a #{home_goals}-#{away_goals} win at home to #{away_team}.
      """,
      """
      There was consternation for #{away_team} today when they were beaten #{home_goals}-#{away_goals} by #{home_team}.
      They had travelled to #{away_team} in confident mood but never really got going.
      With the home crowd in full voice, #{home_team} came racing out of the blocks and never looked back.
      Questions to answer for #{away_team} and their manager, who will surely have heard the catcalls from his own team's fans.
      """
    ]

  def home_win_responses(1 = _surprise_factor, home_team, away_team, home_goals, away_goals),
    do: [
      """
      #{home_team} came into the game with #{away_team} as slight underdogs but were good value for their #{home_goals}-#{away_goals} win.
      """,
      """
      Home advantage proved the difference at #{home_team} today, as #{home_team} came out on top against a team in #{away_team} that many had tipped to win.
      """
    ]

  def home_win_responses(0 = _surprise_factor, home_team, away_team, home_goals, away_goals),
    do: [
      """
      In a tightly-fought encounter, #{home_team} pulled off a #{home_goals}-#{away_goals} win at home to #{away_team}.
      """,
      """
      In a keenly fought afair, #{home_team} triumphed #{home_goals}-#{away_goals} against #{away_team}.
      """
    ]

  def draw_responses(5 = _surprise_factor, home_team, away_team, home_goals, away_goals),
    do: [
      """
      There was a huge shock today when #{home_team} and #{away_team} played out a #{home_goals}-#{away_goals} draw.
      """
    ]

  def draw_responses(4 = _surprise_factor, home_team, away_team, home_goals, away_goals),
    do: [
      """
      There was a real surprise today when #{home_team} and #{away_team} played out a #{home_goals}-#{away_goals} draw.
      """
    ]

  def draw_responses(3 = _surprise_factor, home_team, away_team, home_goals, away_goals),
    do: [
      """
      There was a shock today when #{home_team} and #{away_team} played out a #{home_goals}-#{away_goals} draw.
      """
    ]

  def draw_responses(2 = _surprise_factor, home_team, away_team, home_goals, away_goals),
    do: [
      """
      There was something of a shock today when #{home_team} and #{away_team} played out a #{home_goals}-#{away_goals} draw.
      """
    ]

  def draw_responses(1 = _surprise_factor, home_team, away_team, home_goals, away_goals),
    do: [
      """
      Despite the gap in quality between the two teams, #{home_team} and #{away_team} played out a #{home_goals}-#{away_goals} draw this afternoon.
      """
    ]

  def draw_responses(0 = _surprise_factor, home_team, away_team, home_goals, away_goals),
    do: [
      """
      There was no surprise today when #{home_team} and #{away_team} played out a #{home_goals}-#{away_goals} draw.
      There looked to be little between the two teams before the game and so it proved.
      """
    ]

  def away_win_responses(5 = _surprise_factor, home_team, away_team, home_goals, away_goals),
    do: [
      """
      A stunning result today as #{home_team} were beaten #{home_goals}-#{away_goals} by #{away_team}.
      To lose the game many predicted would be a procession was bad enough; for the defeat to come at home was a disaster.
      This is a result that will echo around the world of football for some time to come.
      """,
      """
      In a result that will go down as one of the greatest in the history of #{away_team}, they travelled to #{home_team} and stunned everybody with a #{home_goals}-#{away_goals} win.
      """
    ]

  def away_win_responses(4 = _surprise_factor, home_team, away_team, home_goals, away_goals),
    do: [
      """
      A result today that nobody could have predicted as #{home_team} were beaten #{home_goals}-#{away_goals} by #{away_team}.
      To lose the game that many predicted would be a procession was bad enough; for the defeat to come at home was a disaster.
      This is a result that will no doubt have severe repercussions for the #{home_team} manager, who was barracked by a disbelieving home support.
      """,
      """
      In a result that will go down as one of the greatest in the history of #{away_team}, they travelled to #{home_team} and stunned everybody with a #{home_goals}-#{away_goals} win.
      """
    ]

  def away_win_responses(3 = _surprise_factor, home_team, away_team, home_goals, away_goals),
    do: [
      """
      A result few will have predicted as #{away_team} went to heavily favoured #{away_team} and pulled off a remarkable #{home_goals}-#{away_goals} win.
      This is a result that will no doubt have severe repercussions for the #{home_team} manager, who was barracked by a disbelieving home support.
      Quite the opposite story for the away manager and his players though, who was serenaded long after the final whistle by a jubilant travelling support.
      """
    ]

  def away_win_responses(2 = _surprise_factor, home_team, away_team, home_goals, away_goals),
    do: [
      """
      There was an upset this afternoon as unfancied #{away_team} won #{home_goals}-#{away_goals} at #{home_team}.
      """,
      """
      On a day when little went right for #{home_team}, they managed to throw away the game against #{away_team} with a #{home_goals}-#{away_goals} defeat.
      """
    ]

  def away_win_responses(1 = _surprise_factor, _home_team, _away_team, _home_goals, _away_goals),
    do: [
      """
      In an even contest this afternoon, it was the visitors who came away with the win.
      """
    ]

  def away_win_responses(0 = _surprise_factor, _home_team, away_team, _home_goals, _away_goals),
    do: [
      """
      The match went to form today as #{away_team} got the win that most people expected.
      """
    ]
end
