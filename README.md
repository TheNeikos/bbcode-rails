# BBCode for Rails

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

    $ rails generate bbcode tagname

For example if we want to create a bbcode tag to easily link to a user

    $ rails generate bbcode user

This will create `app/bbcode/user.rb`.

TODO: Add more information

## Contributing

1. Fork it ( https://github.com/TheNeikos/bbcode-rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
