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
    if event.valid?
      if event.repeats > 0
        event.submit_to_user_or_group current_user, params[:eventable_id]
        event.repeat
      else
        event.submit_to_user_or_group current_user, params[:eventable_id]
      end
      redirect_to root_url, notice: "You have successfuly created the event"
    else
      redirect_to new_event_path, alert: "Invalid data"
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
    params.fetch(:event, {}).permit(:title, :description, :from, :to, :repeats, :step)
  end

  def group_from_params
    names_poluted = params.keys.select { |key| key =~ /.+_group/ }
    names = names_poluted.map { |g| g.gsub /_group/, '' }
    names.map { |name| Group.find_by_name(name) }.first
  end
end
