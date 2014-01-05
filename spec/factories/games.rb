# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game do
    game_name "Battle of The Sexes"
    score_limit 600
    number_of_players 2
    player_turn -1
  	team_turn -1
  end

  factory :game_with_multiple_teams, parent: :game do
  	after(:create) do |game|
  		FactoryGirl.create(:team, game:game)
  		FactoryGirl.create(:team, game:game)
  		FactoryGirl.create(:team, game:game)
  	end
  end
end
