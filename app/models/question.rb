class Question < ActiveRecord::Base
	has_and_belongs_to_many :sources
	belongs_to :type
	validates :body, presence: true
    validates :answer, presence: true
    validates :type, presence: true
    self.inheritance_column = nil
end
