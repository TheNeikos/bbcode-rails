require "bbcode-rails/version"

module BBCode
  PATH = "app/bbcode"
end

require 'bbcode-rails/railtie' if defined?(Rails)
