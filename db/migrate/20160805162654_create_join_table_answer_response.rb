class CreateJoinTableAnswerResponse < ActiveRecord::Migration[5.0]
  def change
    create_join_table :answers, :responses do |t|
      # t.index [:answer_id, :response_id]
      # t.index [:response_id, :answer_id]
    end
  end
end
