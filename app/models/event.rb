class Event < ActiveRecord::Base
  validates_presence_of :title, :description, :repeats, :step
  validates_numericality_of :repeats, :step
  acts_as_commentable

  has_many :tasks
  belongs_to :eventable, polymorphic: true

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

  private

  def recursive_repeat lrepeats, lstep, ldate
    return if lrepeats.zero? or lstep.zero?
    new_event = dup
    new_event.update_attribute(:from, ldate + step.days)
    new_event.update_attribute(:to, ldate + step.days)
    recursive_repeat(lrepeats-1, lstep, ldate + step.days)
  end
end
