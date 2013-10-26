class SuperInheritance < ActiveRecord::Base
  belongs_to :calendarable, polymorphic: true
  belongs_to :super_calendar, class_name: 'GroupCalendar', foreign_key: :calendar_id
end
