class PollsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @poll = Poll.new
  end

  def update
  #  vote = Vote.find(params[:id])
  #  if vote.update_attributes(vote_params)
  #    redirect_to group_path(vote.group), notice: 'Your voice has been heard'
  #  else
  #    redirect_to group_path(vote.group), notice: 'Your voice has\'t been heard'
  #  end
  end

  def vote_for
    poll = Poll.find(params[:id])
    current_user.vote_for(poll)
    poll.check_ready
    redirect_to group_path(poll.group), notice: 'Your voice has been heard'
  end

  def vote_against
    poll = Poll.find(params[:id])
    current_user.vote_against(poll)
    poll.check_ready
    redirect_to group_path(poll.group), notice: 'Your voice has been heard'
  end

  def create

  end

  private

  def poll_params
    params.fetch(:poll, {}).permit(:title, :effect, :subject, :result, :votes_count)
  end
end
