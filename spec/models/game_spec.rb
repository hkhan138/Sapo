require 'spec_helper'

describe Game do
  before (:each) do
  	@game = FactoryGirl.create(:game)
 	end

 	it "should have a game name" do
 		@game.gameName.should be_present
 	end

 	it "should have a score limit" do
 		@game.scoreLimit.should be_present
 	end

 	it "should have at least one player on each team" do
 		@game.numberOfPlayers.should be >= 1
 	end

 	it "should not have a winner" do
 		@game.winnerTeam.should be_nil
 	end

 	it "should set the winner to nil" do
 		@game.setWinnerTeam(nil)
 		@game.winnerTeam.should be_nil
 	end

 	it "should have no teams" do 
 		@game.teams.should be_empty
 	end
 	
 	it "should have some teams" do 
 		team = FactoryGirl.create(:team)
 		@game.teams << team 
 		@game.reload

 		@game.numberOfTeams.should be == 1
 	end

 	it "should indicate player 0's turn" do 
 		@game.nextPlayer
 		@game.playerTurn.should be == 0
 	end

 	it "should go to the next player's turn" do 
 		2.times do 
 			@game.nextPlayer
 		end
 		@game.playerTurn.should be == 1
 	end

 	it "should go back to player 0 after player 1" do 
 		@game.numberOfPlayers.times do
 			@game.nextPlayer
 		end

 		@game.playerTurn.should be == 1
 	end

 	it "should indicate team 0's turn" do 
 		game = FactoryGirl.create(:game_with_multiple_teams)
 		game.nextTeam
 		game.teamTurn.should be == 0
 	end

 	
 	it "should go to the next team" do
		game = FactoryGirl.create(:game_with_multiple_teams) 		
		game.nextTeam

		2.times do
			game.nextTeam
		end
 		game.teamTurn.should be == 2
 	end

 	it "should go back to the first time after the last team" do
 		game = FactoryGirl.create(:game_with_multiple_teams)
 		game.nextTeam

 		game.numberOfTeams.times do
 			game.nextTeam
 		end
 		game.teamTurn.should be == 0
 	end

 	it "should get the first team" do
 		game = FactoryGirl.create(:game_with_multiple_teams)
 		game.nextTeam
 		game.getTeam.should be == game.teams[0]
 	end

 	it "should ge the first player from the first team" do
 		game = FactoryGirl.create(:game_with_multiple_teams)
 		game.nextTeam
 		game.nextPlayer

 		game.getPlayer.should be == game.teams[0].players[0]
 	end

end
