class Type < ActiveRecord::Base
	has_many :questions
	has_and_belongs_to_many :games
end
