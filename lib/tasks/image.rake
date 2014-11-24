namespace :photo do
  desc 'fetch image'
  task fetch: :environment do
    10.times do
      latlng = City.find(1).latlng
      heading = 234
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
