$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'bbcode-rails'

class ITag < BBCode::Tag
  name :i

  on_layout do |args|
    "<em>#{args[1]}</em>"
  end
end

class BrTag < BBCode::Tag
  name :br, :no_closing_tag

  on_layout do |args|
    "<br>"
  end
end

class UserTag < BBCode::Tag
  name :user, :no_closing_tag, :argument

  on_layout do |args|
    "<p>Name: #{args[1]}</p>"
  end
end

class QuoteTag < BBCode::Tag
  name :quote, :argument

  on_layout do |args|
    "<p>Text: #{args[2]}</p><em>User: #{args[1]}</em>"
  end
end
