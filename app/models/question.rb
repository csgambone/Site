class Question < ActiveRecord::Base
	has_many :sources
	has_one :type
	validates :body, presence: true
    validates :answer, presence: true
    validates :type, presence: true
    self.inheritance_column = nil
end
