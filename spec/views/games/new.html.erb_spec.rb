require 'spec_helper'

describe "games/new" do
  before(:each) do
    assign(:game, stub_model(Game,
      :game_name => "MyString",
      :score_limit => 1,
      :number_of_players => 1,
      :winner_team => 1
    ).as_new_record)
  end

  it "renders new game form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", games_path, "post" do
      assert_select "input#game_game_name[name=?]", "game[game_name]"
      assert_select "input#game_score_limit[name=?]", "game[score_limit]"
      assert_select "input#game_number_of_players[name=?]", "game[number_of_players]"
      assert_select "input#game_winner_team[name=?]", "game[winner_team]"
    end
  end
end
