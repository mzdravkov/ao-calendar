class HomeController < ApplicationController
  def index
    @calendar = current_user.personal_calendar
    render 'calendar/show'
  end
end
