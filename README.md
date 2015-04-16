# BBCode for Rails

[![Gem Version](https://badge.fury.io/rb/bbcode-rails.svg)](http://badge.fury.io/rb/bbcode-rails)

`bbcode-rails` is a gem for simple integration of BBCode into your application.
It does not assume your feature scope and thus does not include every tag out
there. However, for ease of developement several BBCode tags are included,
namely:

- Italics `[i] Italics [/i]`
- Bold `[b] Bold [/b]`
- Quote `[quote=ID-Name] You can Quote me[/quote]`
- Image `[img=https://i.imgur.com/V8G8dKg.gif]` or `[img]https://i.imgur.com/V8G8dKg.gif[/img]`


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bbcode-rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bbcode-rails

## Usage

To keep developement simple and easy to understand all tag definitions are found
in `app/bbcode/`. While it is usually better to have one file per tag, usually
tags are not big enough to warrant this, so one can also group them. For example
`styling.rb` could have the simplest tags in it.

### Creating a new tag

You can use the bbcode generator to quickly setup a new tag, simple run

    $ rails generate bb_code:tag tagname

For example if we want to create a bbcode tag to easily link to a user

    $ rails generate bb_code:tag user

This will create `app/bbcode/user_tag.rb`.

```ruby
#app/bbcode/user.rb

class UserTag < BBCode::Tag
    name :user
    on_layout do |args|
        "TODO: Implement user tag"
    end
end
```

You could now add something like:

```ruby
#app/bbcode/user.rb

class UserTag < BBCode::Tag
    name :user, :argument, :no_closing_tag
    on_layout do |args|
        user = User.find_by_id(args[1])
        render partial: 'shared/userquote', locals: { user: user }
    end
end
```

Of course, the limitations are your knowledge in ruby and rails :)


## Contributing

1. Fork it ( https://github.com/TheNeikos/bbcode-rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
