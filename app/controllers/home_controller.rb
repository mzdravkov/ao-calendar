class HomeController < ApplicationController

  def index
    if user_signed_in?
      if params[:view] && params[:day]
        @events = events_for params[:day]
      else
        @events = all_user_events
      end
      @date = params[:month] ? Date.parse(params[:month]) : Date.today
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
    def all_user_events
        @events = current_user.events
        current_user.groups.each do |group|
          @events += group.events
        end
        @events
    end

    def events_for day
      @events = all_user_events.map {|event| event if event.from.to_datetime.strftime("%Y %m %e") == day}
    end
end
