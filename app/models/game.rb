class Game < ActiveRecord::Base
	has_and_belongs_to_many :sources
	has_and_belongs_to_many :types
	has_many :game_questions
end
