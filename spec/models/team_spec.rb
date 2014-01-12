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

	it "should not have a number for it's turn" do 
		@team.turn_number.should be_nil
	end

	it "should belong to a game" do 
		game = FactoryGirl.create(:game)
		game.teams << @team 

		@team.game.should be_present
	end

	it "should have a turn number" do 
		game = FactoryGirl.create(:game)
		@team.turn_number = game.teams.size + 1
		game.teams << @team

		@team.turn_number.should be_present
	end

	it "Should cumulate its player's score" do
		player = FactoryGirl.create(:player)
		@team.players << player 

		@team.players.each do |player|
			player.addToScore(100)
		end
		
		@team.reload
		@team.total_score.should be == 100

	end
	

end
