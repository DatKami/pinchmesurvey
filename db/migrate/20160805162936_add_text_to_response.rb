class AddTextToResponse < ActiveRecord::Migration[5.0]
  def change
	add_column :responses, :text_response, :text
  end
end
