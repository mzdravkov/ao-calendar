class PersonalCalendar < ActiveRecord::Base# < Calendar
  belongs_to :user

  attr_accessor :name

  validates :name, presence: true

  has_many :events, as: :calendarable

  has_many :super_inheritances
  has_many :super_calendars, through: :super_inheritances, as: :calendarable
  #has_many :sub_inheritances, as: :calendarable
end
