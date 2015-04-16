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

    # For eager loading
    if defined?(Rails) && Rails.env.development?
      str.scan(/\[(\w+)(?:=.+)?\]/).each do |tagname|
        begin
          "#{tagname[0]}_tag".camelize.constantize
        rescue NameError
        end
      end
    end

    @@tags.each do |t|
      str.gsub!(t.regex) { t.instance.instance_exec($~, &t.block) }
    end
    str
  end

end

class String
  def bbcode_to_html
    BBCode.parse(self)
  end
end

require 'bbcode-rails/railtie' if defined?(Rails)
require 'bbcode-rails/tag' unless defined?(Rails)
