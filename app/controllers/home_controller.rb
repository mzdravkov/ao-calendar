class HomeController < ApplicationController

  def index
    @events = all_user_events
    if user_signed_in?
      if params[:view] && params[:day]
        @events = @events.reject! {|event| event.from.to_datetime.strftime("%Y%m%-d") != params[:day]}
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
        events = current_user.events
        current_user.groups.each do |group|
          events += group.events
        end
        events
    end
end
