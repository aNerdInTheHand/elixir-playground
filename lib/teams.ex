defmodule MatchEngine.Teams do
  alias Faker
  alias MatchEngine.Team

  def teams, do: [
    %Team{name: "Newcastle", gk_rating: 85, def_rating: 88, mid_rating: 92, att_rating: 90, reputation: 90, manager_rating: 95},
    %Team{name: "Sunderland", gk_rating: 70, def_rating: 69, mid_rating: 69, att_rating: 65, reputation: 75, manager_rating: 60},
    %Team{name: "Manchester United", gk_rating: 80, def_rating: 80, mid_rating: 79, att_rating: 82, reputation: 97, manager_rating: 80},
    %Team{name: "Manchester City", gk_rating: 94, def_rating: 95, mid_rating: 97, att_rating: 98, reputation: 97, manager_rating: 99},
    %Team{name: "South Shields", gk_rating: 20, def_rating: 20, mid_rating: 20, att_rating: 20, reputation: 10, manager_rating: 10},
    random_shite_team("Blyth Spartans"),
    random_shite_team("Whitley Bay"),
    random_shite_team("Morpeth Town"),
    random_shite_team("Bishop Auckland"),
    random_mint_team("Arsenal"),
    random_mint_team("Chelsea"),
    random_mint_team("Liverpool"),
    random_mint_team("Tottenham"),
    random_good_team("Everton"),
    random_good_team("West Ham"),
    random_decent_team("Leicester"),
    random_decent_team("Watford"),
    random_good_team("Crystal Palace"),
    random_decent_team("Stoke"),
    random_mint_team("Napoli")
  ]

  defp random_shite_team(name) do
    %Team{
      name: name,
      gk_rating: Faker.random_between(1, 20),
      def_rating: Faker.random_between(1, 20),
      mid_rating: Faker.random_between(1, 20),
      att_rating: Faker.random_between(1, 20),
      reputation: Faker.random_between(1, 20),
      manager_rating: Faker.random_between(1, 20)
    }
  end

  defp random_poor_team(name) do
    %Team{
      name: name,
      gk_rating: Faker.random_between(10, 30),
      def_rating: Faker.random_between(10, 30),
      mid_rating: Faker.random_between(10, 30),
      att_rating: Faker.random_between(10, 30),
      reputation: Faker.random_between(10, 30),
      manager_rating: Faker.random_between(10, 30)
    }
  end

  defp random_average_team(name) do
    %Team{
      name: name,
      gk_rating: Faker.random_between(30, 50),
      def_rating: Faker.random_between(30, 50),
      mid_rating: Faker.random_between(30, 50),
      att_rating: Faker.random_between(30, 50),
      reputation: Faker.random_between(30, 50),
      manager_rating: Faker.random_between(30, 50)
    }
  end

  defp random_decent_team(name) do
    %Team{
      name: name,
      gk_rating: Faker.random_between(50, 70),
      def_rating: Faker.random_between(50, 70),
      mid_rating: Faker.random_between(50, 70),
      att_rating: Faker.random_between(50, 70),
      reputation: Faker.random_between(50, 70),
      manager_rating: Faker.random_between(50, 70)
    }
  end

  defp random_good_team(name) do
    %Team{
      name: name,
      gk_rating: Faker.random_between(70, 90),
      def_rating: Faker.random_between(70, 90),
      mid_rating: Faker.random_between(70, 90),
      att_rating: Faker.random_between(70, 90),
      reputation: Faker.random_between(70, 90),
      manager_rating: Faker.random_between(70, 90)
    }
  end

  defp random_mint_team(name) do
    %Team{
      name: name,
      gk_rating: Faker.random_between(85, 100),
      def_rating: Faker.random_between(85, 100),
      mid_rating: Faker.random_between(85, 100),
      att_rating: Faker.random_between(85, 100),
      reputation: Faker.random_between(85, 100),
      manager_rating: Faker.random_between(85, 100)
    }
  end
end
