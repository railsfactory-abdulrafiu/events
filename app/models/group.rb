class Group < ActiveRecord::Base
	has_many :events
	has_many :usergroups
	has_many :users, :through => :usergroups
end
