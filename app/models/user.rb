class User < ActiveRecord::Base
  rolify
  acts_as_voter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,# :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :groups
  has_many :events, as: :eventable
  has_and_belongs_to_many :ignored_events, class_name: 'Event', join_table: :ignored_events_users
end
