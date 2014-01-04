require 'spec_helper'

describe "teams/new" do
  before(:each) do
    assign(:team, stub_model(Team,
      :team_name => "MyString",
      :total_score => 1,
      :turn_number => 1
    ).as_new_record)
  end

  it "renders new team form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", teams_path, "post" do
      assert_select "input#team_team_name[name=?]", "team[team_name]"
      assert_select "input#team_total_score[name=?]", "team[total_score]"
      assert_select "input#team_turn_number[name=?]", "team[turn_number]"
    end
  end
end
