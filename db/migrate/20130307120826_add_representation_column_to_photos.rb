class AddRepresentationColumnToPhotos < ActiveRecord::Migration
  def change
  	
  	add_column :photos, :representation, :string

  end
end
