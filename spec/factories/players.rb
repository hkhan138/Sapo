# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :player do
    player_name "Steven"
    score 0
    turn_number nil
  end
end
