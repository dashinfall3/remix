class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :name
  		t.string :username
  		t.string :access_token
      t.string :access_token_secret
  		t.string :profile_image_url
  		t.integer :phone
  		t.timestamps
  	end
  end
end
