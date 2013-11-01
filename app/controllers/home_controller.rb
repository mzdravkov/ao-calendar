class HomeController < ApplicationController

  def index
    if user_signed_in?
      @events = Event.all_user_events current_user
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
end
