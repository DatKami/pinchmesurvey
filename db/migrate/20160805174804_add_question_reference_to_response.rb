class AddQuestionReferenceToResponse < ActiveRecord::Migration[5.0]
  def change
    add_reference :responses, :submission, foreign_key: true
  end
end
