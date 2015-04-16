$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'bbcode-rails'

class ITag < BBCode::Tag
  name :i

  on_layout do |args|
    "<em>#{args[1]}</em>"
  end
end
