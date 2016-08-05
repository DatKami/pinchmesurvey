class DropTextSubmissions < ActiveRecord::Migration[5.0]
  def change
	drop_table :text_submissions
  end
end
