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
    chose_action if poll_result >= 0
    destroy
  end

  def chose_action
    case effect
    when 'join' then join_user_to_group
    when 'kick' then kick_user_from_group
    when 'remove_event' then remove_event_from_group
    end
  end

  def join_user_to_group
    user = User.find(subject.to_i)
    group.join_user(user)
  end

  def kick_user_from_group
    user = User.find(subject.to_i)
    group.kick_user(user)
  end

  def remove_event_from_group
    user = Event.find(subject.to_i)
    group.remove_event(user)
  end

  def self.all_polls
    {'Remove' => 'remove'}
  end

  def self.all_poll_names
    available_polls.values
  end

  def self.all_poll_effects
    available_polls.keys
  end

  def self.all_subjects
    {'users' => group.users.map { |u| [u.name, u.id] },
     'event' => group.events.map { |e| [e.title, e.id] }}
  end
end
