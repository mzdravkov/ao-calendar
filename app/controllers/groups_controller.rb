class GroupsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @group = Group.new
  end

  def create
    group = Group.new(group_params)
    if group.save
      group.users << current_user
      redirect_to root_url, notice: "You have successfuly created the group #{group.name}"
    else
      redirect_to root_url, alert: "Opps. We encountered an error while trying to create the group #{group.name}"
    end
  end

  def join
    group = Group.find(params[:id])
    #group.users << current_user
    poll = Poll.create(title: "Accept #{current_user.name} in the group", effect: 'join', subject: "#{current_user.id}")
    group.polls << poll
    redirect_to root_url, notice: 'Your apply was delivered'
  end

  def edit
  end

  def update
  end

  def index
    @groups = Group.search(params[:search])
  end

  def show
    @group = Group.find(params[:id])
    @events = @group.events
    @date = params[:month] ? Date.parse(params[:month]) : Date.today
  end

  def destroy
  end

  private

  def group_params
    params.fetch(:group, {}).permit(:name)
  end

  def poll_params
    params.fetch(:poll, {}).permit(:title, :effect, :subject, :result, :votes_count)
  end
end
