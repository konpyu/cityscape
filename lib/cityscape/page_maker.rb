module Cityscape
  class PageMaker

    def initialize(lat, lng, heading, key)
      @lat = lat
      @lng = lng
      @heading = heading
      @key = key
    end

    def save_to_file
      filename = "#{Rails.root}/tmp/pages/#{@key}.html"
      File.open(filename,"a") do |f|
        f.puts html
      end
      true
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

  end
end
