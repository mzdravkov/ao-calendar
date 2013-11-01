class Event < ActiveRecord::Base
  validates_presence_of :title, :description, :repeats, :step
  validates_numericality_of :repeats, :step
  acts_as_commentable

  has_many :tasks
  belongs_to :eventable, polymorphic: true
  has_and_belongs_to_many :ignorers, join_table: :ignored_events_users, class_name: 'User'

  def submit_to_user_or_group user, eventable_id
    if eventable_id.empty?
      user.events << self
    else
      Group.find(eventable_id).events << self
    end
  end

  def repeat
    recursive_repeat repeats, step, from
  end

  def self.all_user_events user
    events = user.events
    user.groups.each do |group|
      events += group.events
    end
    events
  end


  private

  def recursive_repeat lrepeats, lstep, ldate
    return if lrepeats.zero? or lstep.zero?
    new_event = dup
    new_event.update_attribute(:from, ldate + step.days)
    new_event.update_attribute(:to, ldate + step.days)
    recursive_repeat(lrepeats-1, lstep, ldate + step.days)
  end
end
