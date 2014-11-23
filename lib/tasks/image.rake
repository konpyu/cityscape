def purge_image
  if Image.count > 9500
    Image.order(id: :desc).limit(500).delete_all
  end
end

namespace :photo do
  desc 'fetch image'
  task fetch: :environment do
    latlng = City.find(1).latlng
    heading = 234
    key = SecureRandom.hex(16)
    Cityscape::PageMaker.new(*latlng, heading, key).save_to_file
    fetcher = Cityscape::Fetcher.new(key)
    fetcher.fetch
    fetcher.upload
    p "fin"
  end

  desc 'clean'
  task clean: :environment do
    `rm -rf #{Rails.root}/tmp`
  end
end
