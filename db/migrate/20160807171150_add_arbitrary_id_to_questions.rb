class AddArbitraryIdToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :arbitrary_sort, :number
  end
end
