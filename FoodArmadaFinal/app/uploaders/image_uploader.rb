class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  # Choose what kind of storage to use for this uploader:                                          
  storage :file

  # Override the directory where uploaded files will be stored.                                    
  # This is a sensible default for uploaders that are meant to be mounted:                         
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Create different versions of your uploaded files:                                              
  version :thumb do
     process :resize_to_fit => [250, 250]
     process :resize_to_fill => [250, 250]
  end

  version :large do
    process :resize_to_fit => [600, 600]
    process :resize_to_fill => [600, 600]
  end

  version :original do
    process :resize_to_fit => [600, 600]
    process :resize_to_fill => [600, 600]
  end

end
