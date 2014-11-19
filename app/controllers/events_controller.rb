class EventsController < ApplicationController

  def index
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event
    else
      render 'index'
    end
  end

  private

    def event_params
      params.require(:event).permit(:title, :date, :time, :location, :description)
    end
end
