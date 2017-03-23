class CloudinaryUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave

  process :convert => 'png'

  version :thumb do
    resize_to_fill(50, 50)
  end

  version :small do
    resize_to_fill(100, 100)
  end

  version :medium do
    resize_to_fill(150, 150)
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
