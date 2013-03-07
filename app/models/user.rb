class User < ActiveRecord::Base
  has_many :inspirations, foreign_key: 'author_id'
  has_many :photos
end
