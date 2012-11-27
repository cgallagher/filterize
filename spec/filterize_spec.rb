require 'spec_helper'

describe Filterize do
  it "should filter my image" do
    
    dir = File.dirname(File.expand_path(__FILE__))
    img = File.open("#{dir}/borat.jpg", 'r')
    overlay_image = File.open("#{dir}/overlay.png", 'r')
    font_path = "#{dir}/fonts/petitformalscript-regular.ttf"
    #factory = Filterize::Factory.new(img).overlay_image(overlay_image, 0, 0, 'center').gotham.grayscale
    factory = Filterize::Factory.new(img).insert_text("Very nice, I like!")
    
    
    FileUtils.mv(factory.result.path, "/Users/chrisgallagher/Desktop/filterize.jpg")
    system "open /Users/chrisgallagher/Desktop/filterize.jpg"
  end
end