class GamesController < ApplicationController
  def index
    matching_games = Game.all

    @list_of_games = matching_games.order({ :created_at => :desc })

    render({ :template => "games/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_games = Game.where({ :id => the_id })

    @the_game = matching_games.at(0)

    @matching_seats = Seat.where(:game_id=>@the_game).order(:created_at=>:desc)

    render({ :template => "games/show.html.erb" })
  end

  def create
    the_game = Game.new
    the_game.game_bank = params.fetch("query_game_bank")
    the_game.big_blind = params.fetch("query_big_blind")
    the_game.small_blind = params.fetch("query_small_blind")
    the_game.game_owner = params.fetch("query_game_owner")
    the_game.game_name = params.fetch("query_game_name")

    if the_game.valid?
      the_game.save
      redirect_to("/games", { :notice => "Game created successfully." })
    else
      redirect_to("/games", { :alert => the_game.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_game = Game.where({ :id => the_id }).at(0)

    the_game.game_bank = params.fetch("query_game_bank")
    the_game.big_blind = params.fetch("query_big_blind")
    the_game.small_blind = params.fetch("query_small_blind")
    the_game.game_owner = params.fetch("query_game_owner")
    the_game.game_name = params.fetch("query_game_name")

    if the_game.valid?
      the_game.save
      redirect_to("/games/#{the_game.id}", { :notice => "Game updated successfully."} )
    else
      redirect_to("/games/#{the_game.id}", { :alert => the_game.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_game = Game.where({ :id => the_id }).at(0)

    the_game.destroy

    redirect_to("/games", { :notice => "Game deleted successfully."} )
  end
end
