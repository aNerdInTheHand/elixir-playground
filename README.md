# Elixir Playground

Repo for sandboxing Elixir ideas.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `bayes` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:bayes, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/bayes>.

## Bayes

The [Bayes module](lib/bayes.ex) is a Bayesian analysis tool.

## Match Engine

The [MatchEngine module](lib/match_engine.ex) is a work-in-progress football match engine to simulate results between two teams.

Note this is ever-changing, but currently it can be called in three ways:

First, run the server with `iex -S mix`

To define your own teams, create a [%Team{} struct](lib/team.ex). It must have the following values:

```elixir
:name,
:gk_rating,
:def_rating,
:mid_rating,
:att_rating,
:reputation,
:manager_rating
```

For example:

```elixir
new = %Team{name: "Newcastle", gk_rating: 85, def_rating: 88, mid_rating: 92, att_rating: 90, reputation: 90, manager_rating: 95}
manu = %Team{name: "Manchester United", gk_rating: 80, def_rating: 80, mid_rating: 79, att_rating: 82, reputation: 97, manager_rating: 80}
```

You can then call the `simulate_game/2` function with the two teams like so:

```elixir
MatchEngine.simulate_game(new, manu)
```

You should get an output like the following:

```
iex(623)> MatchEngine.simulate_game(new, manu)
Winner: :home
Surprise Factor: 1

Match Report
------------
Newcastle 3-0 Manchester United

Home advantage proved the difference at Newcastle today, as Newcastle came out on top against a team in Manchester United that many had tipped to win.


:ok
```

If you want to simulate many games at once, you can call the `simulate_many/3` function like so:

```elixir
MatchEngine.simulate_many(new, manu) # simulate 10 times by default
MatchEngine.simulate_many(new, manu, 3)
```

You should get the output a specified number of times, like so:

```
iex(624)> MatchEngine.simulate_many(new, manu, 3)
Winner: :home
Surprise Factor: 1

Match Report
------------
Newcastle 2-1 Manchester United

Newcastle came into the game with Manchester United as slight underdogs but were good value for their 2-1 win.


Winner: :draw
Surprise Factor: 2

Match Report
------------
Newcastle 0-0 Manchester United

There was something of a shock today when Newcastle and Manchester United played out a 0-0 draw.


Winner: :home
Surprise Factor: 1

Match Report
------------
Newcastle 3-1 Manchester United

Home advantage proved the difference at Newcastle today, as Newcastle came out on top against a team in Manchester United that many had tipped to win.


[:ok, :ok, :ok]
```

Finally, you can simulate any number of games (10 by default) by calling the `simulate_many_random/1` function like so:

```elixir
MatchEngine.simulate_many_random() # simulate 10 matches between random teams
MatchEngine.simulate_many_random(3)
```

You should get output similar to the following:

```
iex(652)> MatchEngine.simulate_many_random(3)
Winner: :home
Surprise Factor: 1

Match Report
------------
West Ham 2-0 Manchester United

West Ham came into the game with Manchester United as slight underdogs but were good value for their 2-0 win.


Winner: :away
Surprise Factor: 3

Match Report
------------
Liverpool 1-2 Newcastle

A result few will have predicted as Newcastle went to heavily favoured Newcastle and pulled off a remarkable 1-2 win.
This is a result that will no doubt have severe repercussions for the Liverpool manager, who was barracked by a disbelieving home support.
Quite the opposite story for the away manager and his players though, who was serenaded long after the final whistle by a jubilant travelling support.


Winner: :draw
Surprise Factor: 2

Match Report
------------
Watford 1-1 Chelsea

There was something of a shock today when Watford and Chelsea played out a 1-1 draw.


[:ok, :ok, :ok]
```