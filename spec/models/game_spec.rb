require 'spec_helper'

describe Game do
  before (:each) do
  	@game = FactoryGirl.create(:game)
 	end

 	it "should have a game name" do
 		@game.game_name.should be_present
 	end

 	it "should have a score limit" do
 		@game.score_limit.should be_present
 	end

 	it "should have at least one player on each team" do
 		@game.number_of_players.should be >= 1
 	end

 	it "should not have a winner" do
 		@game.winner_team.should be_nil
 	end

 	it "should have no teams" do 
 		@game.teams.should be_empty
 	end
 	
 	it "should have some teams" do 
 		team = FactoryGirl.create(:team)
 		@game.teams << team 
 		@game.reload

 		@game.teams.size.should be == 1
 	end

end
