def purge_image
  if Image.count > 9500
    Image.order(id: :desc).limit(500).delete_all
  end
end

namespace :photo do
  desc 'fetch image'
  task fetch: :environment do
    3.times do
      latlng = City.find(1).latlng
      heading = 234
      Cityscape::Generator.new(*latlng, heading).execute
    end
  end

  desc 'clean'
  task clean: :environment do
    `rm -rf #{Rails.root}/tmp`
  end
end
