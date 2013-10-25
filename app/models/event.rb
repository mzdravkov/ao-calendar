class Event < ActiveRecord::Base
  acts_as_commentable
  
  belongs_to :calendarable, polymorphic: true
  has_many :tasks
end
