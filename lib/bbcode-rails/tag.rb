class BBCode::Tag < AbstractController::Base
  include AbstractController::Rendering
  include AbstractController::Helpers
  include AbstractController::Translation
  include AbstractController::AssetPaths
  include ActionView::Rendering
  include Rails.application.routes.url_helpers
  self.view_paths = "app/views"


  def self.inherited subclass
    BBCode.tags << subclass
  end

  def self.block_name n, *args
    if args.include? :argument
      arg = "=(.+?)"
    end
    if args.include? :no_closing_tag
      @regex = /\[#{n.to_s}#{arg}\]/mi
    else
      @regex = /\[#{n.to_s}#{arg}\](.+?)\[\/#{n.to_s}\]/mi
    end
  end

  def self.on_layout &b
    @block = b
  end

  def self.regex
    @regex
  end

  def self.block
    @block
  end
end

