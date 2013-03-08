class Inspiration < ActiveRecord::Base
  has_many :photos
  belongs_to :author, class_name: 'User'

  # before_create :send_inspirations


end
