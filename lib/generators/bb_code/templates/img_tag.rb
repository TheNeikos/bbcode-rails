class ImgTag < BBCode::Tag
  block_name :img, :argument, :no_closing_tag

  on_layout do |args|
    args[1].gsub!(/javascript:/, '')
    "<img src='#{args[1]}'>"
  end
end
