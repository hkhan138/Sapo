class Game < ActiveRecord::Base
  has_many :teams

#Methods that grabs fields from the model
  #getters
  def scoreLimit
    self.score_limit
  end

  def gameName
    self.game_name
  end

  def numberOfPlayers
    self.number_of_players
  end

  def numberOfTeams
  	self.teams.size
  end

  def winnerTeam
		Team.find_by_id(self.winner_team)
  end
  #end getters

  #setters
  def setScoreLimit(limit)
    if limit > 0
      self.score_limit = limit
    	self.save
    end
  end

  def setGameName(name)
    if name.present?
      self.game_name = name
      self.save
    end
  end

  def setNumberOfPlayers(number)
    if number > 0
      self.number_of_players = number
      self
    end
  end

  def setWinnerTeam(teamId)
    if Team.find_by_id(teamId).present?
      self.winner_team = teamId
      self.save
    end
  end
  #end setters
  
  def teamsReady
    
    self.teams.each do |team|
      if team.teamSize != self.numberOfPlayers
        return false
      end
    end
    
    return true
  end

end
