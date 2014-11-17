class Game < ActiveRecord::Base
	has_and_belongs_to_many :sources
	has_and_belongs_to_many :types
	has_many :game_questions

	def GetQuestionSet
		questionSet = Set.new
		self.sources.all.each do |source|
			source.questions.all.each do |question|
				if self.types.include?(question.type)
					questionSet << question
				end
			end
		end

		if questionSet.length() >= self.question_count
			return questionSet
		else
			return nil
		end
	end
end
