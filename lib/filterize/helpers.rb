require 'tempfile'
require 'fileutils'

module Filterize
  
  class Factory
      attr_reader :original, :result
      
      def initialize(file)
        @original = file
        @result = Tempfile.new(["filterize", ".png"])
        FileUtils.cp(@original.path, @result.path)
      end
      
      # super textual insertion
      def insert_text(text = 'Milk was a bad choice!', font_size = 15, font_path = 'Helvetica', fill = 'transparent', color = '#cbfe00', stroke = 'none', gravity = 'southwest', xy = '0', stroke_width = 0)
        convert "#{result.path} -gravity #{gravity} -stroke '#{stroke}' -strokewidth #{stroke_width} -font '#{font_path}' -pointsize #{font_size} -annotate #{xy} '#{text}' #{result.path}"
      end
      
      # shake it like a polaroid pictya - rotates to a random angle between 15 and -15 - http://www.imagemagick.org/script/command-line-options.php?#polaroid
      def polaroid(text = '', gravity = 'center', background = 'none')
        convert "-caption '#{text}' #{result.path} -gravity #{gravity} -background '#{background}' +polaroid #{result.path}"
      end
      
      # pass an image to this guy and he will overlay it on top of the working image
      def overlay_image(overlay_image, pos_x = 0, pos_y = 0, gravity = 'northwest')
        @overlay = Tempfile.new(['ol', '.png'])
        FileUtils.cp(overlay_image.path, @overlay.path)
        convert "-composite #{result.path} #{@overlay.path} -gravity #{gravity} -geometry +#{pos_x}+#{pos_y} #{result.path}"
      end      
      
      # whack a border on it yo!
      def border(width = 20, color = '#cbfe00')
        convert "#{result.path} -bordercolor #{color} -border #{width}x#{width} #{result.path}"
      end
      
      # some actual filters now
      
      # some filter
      def lomo()
        convert "#{result.path} -channel R -level 33% -channel G -level 33% #{result.path}"
      end
      
      # a city of justice
      def gotham #city
        convert "#{result.path} -modulate 120,10,100 -fill #222b6d -colorize 20 -gamma 0.5 -contrast -contrast #{result.path}"
      end
      
      # harris
      def kelvin(width = 20, height = 20)
        convert "( \"#{result.path}\" -auto-gamma -modulate 120,50,100 )( -size {#{width}}x{#{height}} -fill rgba(255,153,0,0.5) -draw 'rectangle 0,0 {#{width}},{#{height}}' ) -compose multiply \"#{result.path}\""
      end
      
      # totes tilts - this one runs a bit slow - maybe 9 seconds
      def tilt_shift()
        convert "#{result.path} \\( +clone -sparse-color Barycentric '0,0 black 0,%[fx:h-1] white' -function polynomial 2,-2,0.5 \\) \ -compose Blur -set option:compose:args 15 -composite #{result.path}"
      end
      
      def grayscale
        convert "#{result.path} -colorspace Gray #{result.path}"
      end
      
      private
      
      def convert(args)
        command = "convert #{args}"
        puts command
        res = `#{command}`
        self
      end
  end
end