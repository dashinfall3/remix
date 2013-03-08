class RepresentationUploader < CarrierWave::Uploader::Base
  # include CarrierWave::MiniMagick
  storage :file
  
  
  # process :resize_to_fill => [200, 200]
end