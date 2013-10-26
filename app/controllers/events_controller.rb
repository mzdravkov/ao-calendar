class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
    @tasks = @event.tasks
    @new_task = Task.new
  end

  def create
   current_user.events << Event.create(event_params)
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    event = Event.find(params[:id])
    if event.update_attributes(event_params)
      redirect_to :action => 'show', :id => @event
    else
      @events = Event.find(:all)
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
