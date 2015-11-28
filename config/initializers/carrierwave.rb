CarrierWave.configure do |config|
  if Rails.env.development?
    config.storage = :file
  else
    config.storage :fog
  end

  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => Rails.application.config.aws_access_key_id,
    :aws_secret_access_key  => Rails.application.config.aws_secret_access_key
  }

  config.fog_directory = Rails.application.config.aws_bucket_name
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end



FOG_STORAGE ||= Fog::Storage.new({
    :provider               => 'AWS',
    :aws_access_key_id      => Rails.application.config.aws_access_key_id,
    :aws_secret_access_key  => Rails.application.config.aws_secret_access_key
})