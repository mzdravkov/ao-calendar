class GroupCalendar < ActiveRecord::Base
  has_and_belongs_to_many :users

  has_many :sub_inheritances
  has_many :sub_calendars, through: :sub_inheritances, source: :calendarable, source_type: :Calendar

  attr_accessor :name

  validates :name, presence: true

  has_many :events, as: :calendarable

  has_many :super_inheritances
  has_many :super_calendars, through: :super_inheritances
  #has_many :sub_inheritances, as: :calendarable
end
