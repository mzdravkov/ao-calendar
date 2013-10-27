class HomeController < ApplicationController

  def index
    if user_signed_in?
      @events = current_user.events
      current_user.groups.each do |group|
        @events += group.events
      end
      @date = params[:month] ? Date.parse(params[:month]) : Date.today
    end
  end

end
