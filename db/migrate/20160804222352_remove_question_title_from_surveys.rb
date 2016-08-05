class RemoveQuestionTitleFromSurveys < ActiveRecord::Migration[5.0]
  def change
	add_column :surveys, :title, :string
	remove_column :surveys, :question_title, :string
	remove_column :surveys, :question_type, :string
  end
end
