CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider                         => 'Google',
    :google_storage_access_key_id     => 'GOOGK5FLTYUYNVH623OW',
    :google_storage_secret_access_key => 'lRpHuE6xewFXr80cXXDfmNz18hZr+kcXQQY5tM3f'
  }
  config.fog_directory = 'aehalo-bucket1'
end

class AvatarUploader < CarrierWave::Uploader::Base
  storage :fog
end
