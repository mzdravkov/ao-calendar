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

    if params[:eventable_id].empty?
      current_user.events << event
    else
      Group.find(params[:eventable_id]).events << event
    end
    redirect_to root_url, notice: "You have successfuly created the event"
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

  def group_from_params
    names_poluted = params.keys.select { |key| key =~ /.+_group/ }
    names = names_poluted.map { |g| g.gsub /_group/, '' }
    names.map { |name| Group.find_by_name(name) }.first
  end
end
