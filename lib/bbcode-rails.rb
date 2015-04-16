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
      str.gsub!(t.regex) { t.new.instance_exec($~, &t.block) }
    end
    str
  end

end

class String
  def to_bbcode
    BBCode.parse(self)
  end
end

require 'bbcode-rails/railtie' if defined?(Rails)
