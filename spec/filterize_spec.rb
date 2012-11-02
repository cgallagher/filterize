require 'spec_helper'

describe Filterize do
  it "should filter my image" do
    
    dir = File.dirname(File.expand_path(__FILE__))
    
    # class FilterizeTest
    #   include Filterize::Factory
    # end
    
    # # super xmas jumpers
    # demo_image_url = "https://by-you.s3.amazonaws.com/dev/entries/26/163025_474539090805_2998726_n_original.jpg?1351861043"
    # 
    # test = FilterizeTest.new
    # test.perform(demo_image_url)
    
    img = File.open("#{dir}/borat.png", 'r')
    overlay_image = File.open("#{dir}/overlay.png", 'r')
    factory = Filterize::Factory.new(img).overlay_image(overlay_image, 100, 100)
    FileUtils.mv(factory.result.path, "/Users/chrisgallagher/Desktop/filterize.jpg")
    system "open /Users/chrisgallagher/Desktop/filterize.jpg"
  end
end