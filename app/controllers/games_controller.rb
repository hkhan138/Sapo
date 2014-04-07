class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  #changes must be done
  # GET /games
  # GET /games.json
  def index
    @games = Game.all
  end

  def home
  end
  
  # GET /games/1
  # GET /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)
    @game.setWinnerTeam(nil)
    @game.setPlayerTurn(0)
    @game.setTeamTurn(0)

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render action: 'show', status: :created, location: @game }
      else
        format.html { render action: 'new' }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to '/' }
      format.json { head :no_content }
    end
  end

  def play
    @game = Game.find_by_id(params[:id])
  end

  def add_points
    @game = Game.find_by_id(params[:id])
    player = @game.getPlayer
    points_scored = params[:points].to_i
    
    player.add_to_score(points_scored)
    player.set_prev_throw(points_scored)
    
    if @game.save
      @game.reload
      if @game.getTeam.totalScore >= @game.score_limit
        @game.setWinnerTeam(@game.getTeam.id)
        redirect_to action: :winner
      else
        @game.nextTeam
        redirect_to action: :play
      end

    else
      format.html {render play_game_path}
      format.json { render json: @game.errors, status: :unprocessable_entity}
    end
  end

  def undo
    @game = Game.find_by_id(params[:id])
    player = @game.prevPlayer

    if player.prev_throw.present?
      player.reduce_from_score(player.prev_throw)
    end

    player.set_prev_throw(nil)
    redirect_to action: :play

  end

  def winner
    @game = Game.find_by_id(params[:id])
    @winner = @game.winnerTeam
  end

  def restart
    @game = Game.find_by_id(params[:id])
    
    @game.setTeamTurn(0)
    @game.setPlayerTurn(0)
    @game.setWinnerTeam(nil)
    @game.clearTeamScore

    redirect_to action: :play
  end

  def top_games
    @games = Game.all.order(score_limit: :desc).limit(20)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:game_name, :score_limit, :number_of_players, :winner_team)
    end

end
