module Cityscape
  class Generator
    def initialize(lat, lng, heading)
      @lat = lat
      @lng = lng
      @heading = heading

      @key = generate_key
    end

    def save_to_file
      p "save to file"
      filename = "#{Rails.root}/tmp/#{@key}.html"
      File.open(filename,"a") do |f|
        f.puts html
      end
      true
    end

    def fetch
      p "fetch"
      `#{command}`
    end

    def upload
      p "upload"
      image_file = File.open("#{key_to_html_path}.png")
      photo = Photo.new
      photo.image = image_file
      photo.city_id = 1
      photo.lat = @lat
      photo.lng = @lng
      photo.active = false
      photo.save!
    end

    def cleanup
    end

    def execute
      save_to_file
      fetch
      upload
      cleanup
    end

    private

    def generate_key
      SecureRandom.hex(16)
    end

    def html
      '<!DOCTYPE html>' +
      '<html>' +
      '<head>' +
      '<meta charset="UTF-8" />' +
      '<title></title>' +
      '</head>' +
      '<body>' +
      "<img src=\"http://maps.googleapis.com/maps/api/streetview?size=640x380&location=#{@lat},#{@lng}&fov=90&pitch=0&heading=#{@heading}&sensor=false\">" +
      '</body>' +
      '</html>'
    end

    def key_to_html_path
      "#{Rails.root}/tmp/#{@key}.html"
    end

    def command
      "phantomjs #{phantom_script_path} #{key_to_html_path}"
    end

    def phantom_script_path
      "#{Rails.root}/lib/assets/javascripts/image.js"
    end
  end
end
