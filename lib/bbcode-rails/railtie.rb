module BBCode
  class Railtie < Rails::Railtie
    initializer 'bbcode.autoload', :before => :set_autoload_paths do |app|
      app.config.autoload_paths << BBCode::PATH
    end
  end
end
