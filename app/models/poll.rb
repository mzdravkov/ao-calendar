class Poll < ActiveRecord::Base
  acts_as_voteable
  belongs_to :group

  def check_ready
    ready = (votes.count >= 6.0/10*group.users.count)
    end_poll! if ready
    ready
  end

  def poll_result
    votes.map { |vote| vote.vote ? 1 : -1 }.inject(&:+)
  end

  def end_poll!
    if poll_result >= 0
      # it is accepted and do something
      chose_action
    end
    destroy
  end

  def chose_action
    case effect
    when 'join' then join_user_to_group
    end
  end

  def join_user_to_group
    user = User.find(subject.to_i)
    group.join_user(user)
  end
end
