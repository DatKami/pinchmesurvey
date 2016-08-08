# Public: A model for questions.
class Question < ApplicationRecord
  belongs_to :survey
  has_many :answers
  has_many :responses, through: :answers
  validates :title,   presence: true, length: { minimum: 3 }
  validates :answer_type, acceptance: { accept: ['dropdown', 'checkboxes', 'text'], message: " should be something other than \"Select an option\"" }
end
