class Calendar < ActiveRecord::Base
  attr_accessor :name

  validates :name, presence: true

  belongs_to :user
  has_many :events
end
