require 'spec_helper'

describe Team do
	before (:each) do 
		@team = FactoryGirl.create(:team)
	end

	it "should have a team name" do 
		@team.team_name.should be_present
	end

	it "should start with a score of 0" do 
		@team.total_score.should be == 0
	end

	it "should belong to a game" do 
		game = FactoryGirl.create(:game)
		game.teams << @team 

		@team.game.should be_present
	end

	
	it "Should cumulate its player's score" do
		player = FactoryGirl.create(:player)
		@team.players << player 

		@team.players.each do |player|
			player.add_to_score(100)
		end
		
		@team.reload
		@team.total_score.should be == 100

	end
	

end
