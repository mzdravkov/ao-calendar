class SubInheritance < ActiveRecord::Base
  belongs_to :group_calendar
  belongs_to :calendarable, polymorphic: true
end
