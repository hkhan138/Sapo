class Player < ActiveRecord::Base
	belongs_to :team
	after_save :updateMyTeam, only: [:addToScore,:reduceFromScore]

	#getters

	def playerName
		self.player_name
	end

	def pointsScored
		self.score
	end

	def turnNumber
		self.turn_number
	end

	def addToScore(number)
		self.score += number
		self.save
	end

	def reduceFromScore(number)
		self.score -= number
		self.save
	end

	def getTeam
		self.team
	end

	def updateMyTeam
		if self.team.present?
			self.team.updateTotalScore
		end
	end

end
