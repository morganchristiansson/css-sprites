
module CSSSprites
    class MyRailtie < Rails::Railtie
      initializer "my_railtie.configure_rails_initialization" do
      ::CSSSprites::IndexFileName = File.join(Rails.root, "tmp", "css-sprites-index.marshal")
      ::CSSSprites::CSSFileName = File.join(Rails.root, "app", "assets", "stylesheets", "sprite-mappings.css")
      end
    end

    ConfigFileName = "css-sprites.yml"


    def self.read_config
        raise Rails.root if Rails.root.nil?
        filename = File.join(Rails.root, "config", ConfigFileName)
        unless File.exist?(filename)
            STDERR.puts "Error in CSS Sprites: config/#{ConfigFileName} not found."
            return {}
        end

        HashWithIndifferentAccess.new(YAML::load(File.read(filename)))
    end

    mattr_accessor :config
    def self.config
      @@config ||= read_config
    end
end

class ActionView::Base
    include CSSSprites::ViewMethods
end

