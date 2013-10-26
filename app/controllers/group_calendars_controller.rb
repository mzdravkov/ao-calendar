class GroupCalendarsController < ApplicationController
  def new
    @group_calendar = GroupCalendar.new
  end

  def create
    group_calendar = GroupCalendar.new(params[:group_calendar])
    if group_calendar.save
      redirect_to root_url, notice: "You have successfuly created the group calendar #{group_calendar.name}"
    else
      redirect_to root_url, alert: "Creating the group #{group_calendar.name} failed. We're sorry."
    end
  end

  def show
    @group_calendar = GroupCalendar.find(params[:id])
  en

  def edit
  end

  def update
  end

  def destroy
  end
end
