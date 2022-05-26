class SeatsController < ApplicationController
  def index
    matching_seats = Seat.all

    @list_of_seats = matching_seats.order({ :created_at => :desc })

    render({ :template => "seats/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_seats = Seat.where({ :id => the_id })

    @the_seat = matching_seats.at(0)

    render({ :template => "seats/show.html.erb" })
  end

  def create
    the_seat = Seat.new
    the_seat.user_id = params.fetch("query_user_id")
    the_seat.game_id = params.fetch("query_game_id")

    if the_seat.valid?
      the_seat.save
      redirect_to("/seats", { :notice => "Seat created successfully." })
    else
      redirect_to("/seats", { :alert => the_seat.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_seat = Seat.where({ :id => the_id }).at(0)

    the_seat.user_id = params.fetch("query_user_id")
    the_seat.game_id = params.fetch("query_game_id")

    if the_seat.valid?
      the_seat.save
      redirect_to("/seats/#{the_seat.id}", { :notice => "Seat updated successfully."} )
    else
      redirect_to("/seats/#{the_seat.id}", { :alert => the_seat.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_seat = Seat.where({ :id => the_id }).at(0)

    the_seat.destroy

    redirect_to("/seats", { :notice => "Seat deleted successfully."} )
  end
end
