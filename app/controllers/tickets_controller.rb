class TicketsController < ApplicationController
  def destroy
    ticket = Ticket.find(params[:id])
    ticket.destroy

    redirect_to flights_path
  end
end
