require 'spec_helper'

describe Filterize do
  it "should filter my image" do
    
    dir = File.dirname(File.expand_path(__FILE__))
    img = File.open("#{dir}/borat.jpg", 'r')
    overlay_image = File.open("#{dir}/overlay.png", 'r')
    font_path = "#{dir}/fonts/petitformalscript-regular.ttf"
    #factory = Filterize::Factory.new(img).overlay_image(overlay_image, 0, 0, 'center')#.insert_text('Boom Boom', 100, 'Helvetica', 'transparent', '#cbfe00', '#cbfe00', 'southwest', '+0+100')
    factory = Filterize::Factory.new(img).insert_text('this is a really really \\nreally long string of text that I want to wrap on to a new line', 30, 'Helvetica', 'transparent', '#cbfe00', '#cbfe00', 'southwest', '+0+100')
    
    FileUtils.mv(factory.result.path, "/Users/chrisgallagher/Desktop/filterize.jpg")
    system "open /Users/chrisgallagher/Desktop/filterize.jpg"
  end
end