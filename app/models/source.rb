class Source < ActiveRecord::Base
	has_and_belongs_to_many :questions
	has_and_belongs_to_many :games
end
