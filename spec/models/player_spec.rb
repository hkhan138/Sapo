require 'spec_helper'

describe Player do
  before(:each) do 
  	@player = FactoryGirl.create(:player)
  end

  it "should have a name" do 
  	@player.player_name.should be_present
  end

  it "should have a starting score" do
  	@player.score.should be == 0
  end

  it "should have a team" do 
  	team = FactoryGirl.create(:team)
  	team.players << @player 

  	@player.team.should be_present
  end

  it "should increment its score" do 
    @player.add_to_score(400)
    @player.score.should be == 400
  end

  it "should remove for its score" do
    @player.reduce_from_score(100)
    @player.score.should be == -100
  end

end
