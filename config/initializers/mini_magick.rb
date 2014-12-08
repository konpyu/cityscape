# ext mini_magick
# http://stackoverflow.com/questions/8894194/retrieving-the-hex-code-of-the-color-of-a-given-pixel
module MiniMagick
  class Image
    def pixel_at(x, y)
      case run_command("convert", "#{path}[1x1+#{x}+#{y}]", "txt:").split("\n")[1]
      when /^0,0:.*(#[\da-fA-F]{6}).*$/ then $1
      else nil
      end
    end
  end
end
