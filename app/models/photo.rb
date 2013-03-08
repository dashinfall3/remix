class Photo < ActiveRecord::Base
  belongs_to :inspiration
  belongs_to :user

  mount_uploader :representation, RepresentationUploader

end
