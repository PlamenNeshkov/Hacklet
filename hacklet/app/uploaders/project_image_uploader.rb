# encoding: utf-8

class ProjectImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    ActionController::Base.helpers.asset_path("fallback/default_project_image.png")
  end

  process :resize_to_fit => [1200, 800]

  version :thumb do
    process :resize_to_fit => [600, 375]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
