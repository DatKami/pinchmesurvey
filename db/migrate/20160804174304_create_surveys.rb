class CreateSurveys < ActiveRecord::Migration[5.0]
  def change
    create_table :surveys do |t|
      t.string :question_title
      t.string :question_type

      t.timestamps
    end
  end
end
