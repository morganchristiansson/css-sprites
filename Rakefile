require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the css_sprites plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the css_sprites plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'CSSSprites'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "morganchristiansson-css-sprites"
    gemspec.summary = "A Rails plugin for generate CSS sprites"
    gemspec.description = "The first step is generate the index:

    $ rake css_sprites:update
This will find all the images and make a bundle with them. Animated images (like GIF or APNG with two or more frames) are always excluded.

The plugin will create one image per format (a file with JPEG images, another file with PNGs, ...).

And that is all."
    gemspec.email = "code@mog.se"
    gemspec.homepage = "http://github.com/morganchristiansson/css-sprites"
    gemspec.authors = ["Ayose (setepo)", "Morgan Chrisitansson"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

