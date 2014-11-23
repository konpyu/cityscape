module Cityscape
  class Fetcher
    def initialize(key)
      @key = key
    end

    def fetch
      p command
      `#{command}`
    end

    def upload
      image_file = File.open("#{key_to_html_path}.png")
      photo = Photo.new
      photo.image = image_file
      photo.city_id = 1
      photo.save!
    end

    private

    def key_to_html_path
      "#{Rails.root}/tmp/#{@key}.html"
    end

    def command
      "bin/phantomjs #{phantom_script_path} #{key_to_html_path}"
    end

    def phantom_script_path
      "#{Rails.root}/lib/assets/javascripts/image.js"
    end
  end
end
