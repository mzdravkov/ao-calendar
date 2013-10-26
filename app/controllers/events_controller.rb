class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def index
    @events = Event.find(:all)
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)
    @event.save
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      redirect_to :action => 'show', :id => @event
    else
      @subjects = Event.find(:all)
      render :action => 'edit'
    end
  end

  def destroy
    Event.find(params[:id]).destroy
  end

  private

  def event_params
    params.fetch(:event, {}).permit(:title, :description, :from, :to)
  end
end
