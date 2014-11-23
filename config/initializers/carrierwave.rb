CarrierWave.configure do |config|
  config.storage         = :fog
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV['AWS_SECRET_KEY'],
    :aws_secret_access_key  => ENV['AWS_ACCESS_KEY'],
    :region                 => 'ap-northeast-1'
  }

  config.fog_directory = 'city-scape' if Rails.env.production?
  config.fog_directory = 'city-scape-dev' if Rails.env.development?
  config.fog_public     = true
  config.fog_attributes = { 'Cache-Control' => 'max-age=315576000', 'Expires' => 10.years.from_now.httpdate }
  config.fog_authenticated_url_expiration = (365 * 24 * 60 * 60)
  config.remove_previously_stored_files_after_update = false
end
