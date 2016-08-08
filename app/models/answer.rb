# Public: A model for  answers.
class Answer < ApplicationRecord
  belongs_to :question
  has_and_belongs_to_many :responses, dependent: :destroy
end
