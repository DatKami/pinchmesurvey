class RenameTypeOnQuestions < ActiveRecord::Migration[5.0]
  def change
	rename_column :questions, :type, :answer_type
	add_reference :questions, :survey, foreign_key: true
  end
end
