require "rmagick"

source = Magick::Image.read("borat.png").first
#source = source.resize_to_fill(70, 70).quantize(256, Magick::GRAYColorspace).contrast(true)
overlay = Magick::Image.read("overlay.png").first
result = source.composite!(overlay, 0, 0, Magick::OverCompositeOp)
text = Magick::Draw.new
text.annotate(result, 0, 0, 0, 60, "My friend!") {
    self.gravity = Magick::SouthGravity
    self.pointsize = 48
    self.stroke = 'transparent'
    self.fill = '#0000A9'
    self.font_weight = Magick::BoldWeight
    }
result.write("out.png")