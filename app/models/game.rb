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

  def getTeam
    self.teams[self.teamTurn]
  end

  
  def getTeamsInScoreOrder
    self.teams.order(total_score: :desc)
  end

  def getPlayer
    self.teams[self.teamTurn].players[self.playerTurn]
  end

  def playerTurn
    self.player_turn
  end

  def teamTurn
    self.team_turn
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
      self.save
    end
  end

  def setWinnerTeam(teamId)

    if Team.find_by_id(teamId).present?
      self.winner_team = teamId
      self.save
    end
  end
  #end setters
  
  def setPlayerTurn(number)
    self.player_turn = number
    self.save
  end

  def setTeamTurn(number)
    self.team_turn = number
    self.save
  end
  
  def nextPlayer
    self.player_turn += 1
    self.save
    self.reload
    
    if self.player_turn == self.numberOfPlayers
      self.player_turn = 0
      self.save
    end
  end

  def nextTeam
    self.team_turn += 1
    self.save
    self.reload
    
    if self.team_turn == self.numberOfTeams
      self.team_turn = 0
      self.save
      self.nextPlayer
    end
  end

  def clearTeamScore
    self.teams.each do |team|
      team.clearPlayersScore
    end
    self.save
    
  end
  def teamsReady
    if self.numberOfTeams > 1
      self.teams.each do |team|
        if team.teamSize != self.numberOfPlayers
          return false
        end
      end
    else
      return false
    end
    return true
  end

end
