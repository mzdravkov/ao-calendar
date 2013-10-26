class Task < ActiveRecord::Base
  acts_as_commentable

  belongs_to :event
end
