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
    event = Event.create(event_params)

    current_user.events << event if params.keys.include? 'personal'
    post_to = params.keys.select { |key| key =~ /.+_group/ }
    post_to.each do |group_name|
      Group.find_by_name(group_name).events << event
    end
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
