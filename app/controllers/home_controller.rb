class HomeController < ApplicationController

  def index
    if user_signed_in?
      @events = current_user.events
      @date = params[:month] ? Date.parse(params[:month]) : Date.today
    end
  end

end
