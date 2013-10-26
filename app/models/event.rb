class Event < ActiveRecord::Base
  acts_as_commentable

  has_many :tasks
  belongs_to :eventable, polymorphic: true
end
