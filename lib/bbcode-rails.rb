require "bbcode-rails/version"

module BBCode
  PATH = "app/bbcode"

  @@tags = []
  def self.tags
    @@tags
  end

  def self.parse str
    str = str.dup
    @@tags.each do |t|
      str.gsub!(t.regex) { t.block.call($~) }
    end
    str
  end

  class Tag
    def self.inherited subclass
      BBCode.tags << subclass
    end

    def self.name n, args={}
      @@regex = /\[#{n.to_s}\](.+?)\[\/#{n.to_s}\]/mi
    end

    def self.on_layout &b
      @@block = b
    end

    def self.regex
      @@regex
    end

    def self.block
      @@block
    end
  end
end

class String
  def to_bbcode
    BBCode.parse(self)
  end
end

require 'bbcode-rails/railtie' if defined?(Rails)
