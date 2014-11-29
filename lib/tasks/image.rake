namespace :photo do
  desc 'fetch image'
  task fetch: :environment do
    cities_to_collect = City.is_collect.sample
    fail if cities_to_collect.blank?
    10.times do
      latlng  = cities_to_collect.latlng
      heading = rand(360)
      Cityscape::Generator.new(*latlng, heading).execute
    end
  end

  desc 'delete old photo'
  task purge: :environment do
    # limitation of heroku
    if Photo.all.count >= 9500
      Photo.order(id: :asc).limit(300).destroy_all
    end
  end
end
