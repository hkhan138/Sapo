require 'spec_helper'

describe "teams/show" do
  before(:each) do
    @team = assign(:team, stub_model(Team,
      :team_name => "Team Name",
      :total_score => 1,
      :turn_number => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Team Name/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
