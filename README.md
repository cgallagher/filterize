#Filterize

This gem will soon be renamed to something cooler but this will do for now!

###Setup
1). Add the following to your Gemfile
	
	source 'https://gems.gemfury.com/gqzpdJ9pZKzYwqcrhZ8q/'
	gem 'filterize'
	
Filterize is currently running at version 0.0.6

Once installed you can run commands such as:

    dir = File.dirname(File.expand_path(__FILE__))
    img = File.open("#{dir}/borat.jpg", 'r')
    factory = Filterize::Factory.new(img).insert_text("Very nice, I like!").overlay_image(your_image_here, 100, 100).tilt_shift
    result = factory.result.path
    
    
A full list of the available helpers can be found in lib/filterize/helpers.rb