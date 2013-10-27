class Group < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :events, as: :eventable
  has_many :polls

  def join_user user
    users << user
  end

  def kick_user user
    users.delete user.id
  end

  def remove_event event
    events.delete event.id
  end

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end
