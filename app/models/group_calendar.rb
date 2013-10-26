class GroupCalendar < Calendar
  has_and_belongs_to_many :users

  has_many :sub_inheritances
  has_many :sub_calendars, through: :sub_inheritances
end
