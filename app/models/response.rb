class Response < ApplicationRecord
	belongs_to :submission
	has_and_belongs_to_many :answers
	belongs_to :question
end
