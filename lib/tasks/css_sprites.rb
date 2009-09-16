$VERBOSE = nil
Dir["#{Gem.searcher.find('css_sprites').full_gem_path}/lib/tasks/*.rake"].each { |ext| load ext }

