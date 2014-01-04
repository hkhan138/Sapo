require 'spec_helper'

describe "players/edit" do
  before(:each) do
    @player = assign(:player, stub_model(Player,
      :player_name => "MyString",
      :score => 1,
      :turn_number => 1
    ))
  end

  it "renders the edit player form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", player_path(@player), "post" do
      assert_select "input#player_player_name[name=?]", "player[player_name]"
      assert_select "input#player_score[name=?]", "player[score]"
      assert_select "input#player_turn_number[name=?]", "player[turn_number]"
    end
  end
end
