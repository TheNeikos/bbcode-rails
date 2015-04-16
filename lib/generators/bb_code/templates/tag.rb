<% module_namespacing do -%>
class <%= name.classify %>Tag < BBCode::Tag
  block_name :<%= name %>

  on_layout do |args|
    "TODO: Implement <%= name %> tag"
  end
end
<% end -%>
