class Team < ActiveRecord::Base
	belongs_to :game
	has_many :players

	def updateTotalScore
		updatedScore = self.players.sum(:score)
		self.total_score = updatedScore
		self.save
	end
	
	def teamName
		self.team_name
	end

	def totalScore
		self.total_score
	end
	
	def teamSize
		self.players.size
	end
	
	def getPlayersInOrder
		self.players.order(score: :desc)
	end 

	def clearPlayersScore
		self.players.each do |player|
			player.reduceFromScore(player.pointsScored)
		end
	end
end
