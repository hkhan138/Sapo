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

  it "should not have a turn number" do
  	@player.turn_number.should be_nil
  end

  it "should have a team" do 
  	team = FactoryGirl.create(:team)
  	team.players << @player 

  	@player.team.should be_present
  end

  it "should have a turn number" do 
  	game = FactoryGirl.create(:game)
  	team = FactoryGirl.create(:team)
  	
  	game.teams << team
  	game.reload 

  	#if we can add a player we add a player
  	if team.players.size < game.number_of_players
  		@player.turn_number = team.players.size 
  	end

  	team.players << @player
  	team.reload

  	@player.turn_number.should be_present
  end

  it "should increment its score" do 
    @player.addToScore(400)
    @player.score.should be == 400
  end

  it "should remove for its score" do
    @player.reduceFromScore(100)
    @player.score.should be == -100
  end

end
