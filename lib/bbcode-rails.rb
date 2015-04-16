require "bbcode-rails/version"

module BBCode
  @@tags = []
  def self.tags
    @@tags
  end

  def self.parse str
    str = str.dup

    str.gsub!( '&', '&amp;' )
    str.gsub!( '<', '&lt;' )
    str.gsub!( '>', '&gt;' )
    str.gsub!( '"', '&quot;' )
    str.gsub!( "'", '&apos;' )

    @@tags.each do |t|
      str.gsub!(t.regex) { t.block.call($~) }
    end
    str
  end

  class Tag
    def self.inherited subclass
      BBCode.tags << subclass
    end

    def self.name n, *args
      if args.include? :argument
        arg = "=(.+?)"
      end
      if args.include? :no_closing_tag
        @regex = /\[#{n.to_s}#{arg}\]/mi
      else
        @regex = /\[#{n.to_s}#{arg}\](.+?)\[\/#{n.to_s}\]/mi
      end
    end

    def self.on_layout &b
      @block = b
    end

    def self.regex
      @regex
    end

    def self.block
      @block
    end
  end
end

class String
  def to_bbcode
    BBCode.parse(self)
  end
end

require 'bbcode-rails/railtie' if defined?(Rails)
