class Survey < ApplicationRecord
	has_many :questions
	has_many :responses, through: :questions
	validates :title, 	presence:true,
						length: { minimum: 3 }
end
