defmodule MatchEngine.Team do
  defstruct [:name, :gk_rating, :def_rating, :mid_rating, :att_rating, :reputation, :manager_rating]
end

# new = %Team{name: "Newcastle", gk_rating: 85, def_rating: 88, mid_rating: 92, att_rating: 90, reputation: 90, manager_rating: 95}
# sun = %Team{name: "Sunderland", gk_rating: 70, def_rating: 69, mid_rating: 69, att_rating: 65, reputation: 75, manager_rating: 60}
# manu = %Team{name: "Manchester United", gk_rating: 80, def_rating: 80, mid_rating: 79, att_rating: 82, reputation: 97, manager_rating: 80}
# manc = %Team{name: "Manchester City", gk_rating: 94, def_rating: 95, mid_rating: 97, att_rating: 98, reputation: 97, manager_rating: 99}
# shlds = %Team{name: "South Shields", gk_rating: 20, def_rating: 20, mid_rating: 20, att_rating: 20, reputation: 10, manager_rating: 10}
