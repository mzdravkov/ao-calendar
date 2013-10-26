class Calendar < ActiveRecord::Base
  attr_accessor :name

  validates :name, presence: true

  has_many :events, as: :calendarable

  has_many :super_inheritances
  has_many :super_calendars, through: :super_inheritances
end
