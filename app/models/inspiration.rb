class Inspiration < ActiveRecord::Base
  has_many :photos
  belongs_to :author, class_name: 'User'
end
