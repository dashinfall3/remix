class CreateInspirations < ActiveRecord::Migration
  def change
  	create_table :inspirations do |t|
  		t.string :content
  		t.timestamps
  		t.integer :author_id
  	end
  end
end
