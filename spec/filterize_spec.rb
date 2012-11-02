require 'spec_helper'

describe Filterize do
  it "should filter my image" do
    
    dir = File.dirname(File.expand_path(__FILE__))
        
    img = File.open("#{dir}/borat.png", 'r')
    overlay_image = File.open("#{dir}/overlay.png", 'r')
    factory = Filterize::Factory.new(img).overlay_image(overlay_image, 100, 100)
    FileUtils.mv(factory.result.path, "/Users/chrisgallagher/Desktop/filterize.jpg")
    system "open /Users/chrisgallagher/Desktop/filterize.jpg"
  end
end