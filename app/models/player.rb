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

	def prev_throw
		self.previous_throw
	end

	def set_prev_throw(number)
		self.previous_throw = number
		self.save
	end

	def add_to_score(number)
		self.score += number
		self.save
	end

	def reduce_from_score(number)
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
