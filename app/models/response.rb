# Public: A model for responses.
class Response < ApplicationRecord
  belongs_to :submission
  has_and_belongs_to_many :answers
  accepts_nested_attributes_for :answers
  belongs_to :question
end
