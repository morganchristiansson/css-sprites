module CSSSprites
    module ViewMethods

        def self.included(base)
            base.alias_method_chain :image_tag, :css_sprite
        end

        def image_tag_with_css_sprite(source, options = {})
            @__css_sprites_index ||= (Marshal.load(File.read(CSSSprites::IndexFileName)) rescue nil) || {}
            if info = @__css_sprites_index[source.to_s]
                source = CSSSprites.config[:background]
                options[:style] = "background: url(#{image_path info[:bundle]}) -#{info[:x]}px -#{info[:y]}px; #{options[:style]}"
                options[:width] = info[:width]
                options[:height] = info[:height]
            end

            image_tag_without_css_sprite(source, options)
        end
        def css_sprite source, options = {}
            @__css_sprites_index ||= (Marshal.load(File.read(CSSSprites::IndexFileName)) rescue nil) || {}
            if info = @__css_sprites_index[source.to_s]
                "background: url(#{image_path info[:bundle]}) no-repeat -#{info[:x]}px -#{info[:y]}px;"
            end
        end
        def css_sprite_class source, options = {}
            @__css_sprites_index ||= (Marshal.load(File.read(CSSSprites::IndexFileName)) rescue nil) || {}
            raise source.to_s+" not found in index: #{CSSSprites::IndexFileName}" unless info = @__css_sprites_index[source.to_s]
            source.to_s.match(/\/(.*)\./)[1]
        end
    end
end

