# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game do
    game_name "Battle of The Sexes"
    score_limit 600
    number_of_players 2
    winner_team nil
  end
end
