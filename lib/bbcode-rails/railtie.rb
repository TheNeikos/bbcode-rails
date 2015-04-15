module BBCode
  class Railtie < Rails::Railtie
    initializer 'bbcode.autoload', :before => :set_autoload_paths do |app|
      app.config.autoload_paths << BBCode::PATH
      puts "Loaded BBCode at #{BBCode::PATH}"
    end

    console do
      puts "Yooo"
    end
  end
end
